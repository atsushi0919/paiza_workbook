# 通貨レート (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_008/forest_contest_008__currency_rate

INPUT1 = <<"EOS"
12
72
130
125
93
101
75
99
88
93
102
87
115
EOS

OUTPUT1 = <<"EOS"
1
2
EOS

INPUT2 = <<"EOS"
48
126
86
116
77
114
129
85
128
79
129
124
90
105
76
90
126
93
116
71
108
78
91
74
83
123
89
102
74
84
83
120
94
91
114
124
112
103
127
108
127
76
102
102
127
123
83
100
114
EOS

INPUT3 = <<"EOS"
8
75
85
70
75
130
120
70
120
80
EOS

def rand_ary(low, high, n, seed = 0)
  srand(seed)
  n.times.map { rand(low..high) }
end

n = 10000
m = rand_ary(70, 130, n)

# 解答例2
# n, *m = $stdin.read.split.map(&:to_i)
# n, *m = INPUT3.split.map(&:to_i)

# [日付, レート]の形式で、レート降順・日付昇順でソートした配列を生成
s_m = m.map.with_index { |v, i| [i, v] }.sort_by { |x| [-x[1], x[0]] }

buy_idx = 0
max_profit = { profit: 0 }
while buy_idx < n && s_m.length > 0
  # 売る日, レート
  sell_idx, sell_rate = s_m.shift

  # 探索済みの区間は調べない
  next if sell_idx <= buy_idx

  # buy_idx 以上 sell_idx 未満の区間での最低レート（買う日）を探す
  # 70 ≦ m_i（レート） ≦ 130
  buy_rate = 999
  (buy_idx...sell_idx).each do |tmp_idx|
    if m[tmp_idx] < buy_rate
      buy_idx = tmp_idx
      buy_rate = m[tmp_idx]
    end
  end

  # 最高利益の更新
  profit = sell_rate - buy_rate
  if max_profit[:profit] < profit
    max_profit = {
      buy_date: buy_idx + 1,
      sell_date: sell_idx + 1,
      profit: profit,
    }
  end

  # 次の区間の開始地点を設定
  buy_idx = sell_idx + 1
end

puts max_profit[:profit] > 0 ? [max_profit[:buy_date], max_profit[:sell_date]] : "No"

# l = 0
# p sell_idx = sell_idx(l, m)

# exit
# while l < n - 1
# end

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
n 日間の為替レートが 1 ドル m_1,...,m_n 円で入力されます。あなたは 2 回の為替取引を行って今持っている円を最大化させたいです。
最大化するにはどの日に円からドルに換金して、どの日にドルから円に換金し戻せば良いかを求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
m_1
...
m_n


・ 1 行目に、日数 n、二行目以降に 1 ドルあたり m_i (1 ≦ i ≦ n) が整数で改行区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 行目に円からドルに換金する日、二行目にドルから円に換金する日を出力してください。
換金せずそのまま保持しておいた方が良い場合(どのケースでも円を増やすことができない場合)は「No」を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。・　 1 ≦ n ≦ 100 ・70 ≦ m_i ≦ 130 (1 ≦ i ≦ n)

入力例1
12
72
130
125
93
101
75
99
88
93
102
87
115

出力例1
1
2
=end
