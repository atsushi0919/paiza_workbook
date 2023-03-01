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

OUTPUT2 = <<"EOS"
1
2
EOS

def profit(l, a)
  # idx: l, val: a[l] を基準に調査
  buy = { idx: l, val: a[l] }
  sell = { idx: nil, val: -1 }

  # idx: l 以降で最も早い最高値の日を調べる
  r = l + 1
  while r < a.length
    if buy[:val] < a[r] && sell[:val] < a[r]
      sell = { idx: r, val: a[r] }
    end
    r += 1
  end
  # 儲けが出ないなら nil を返す
  return if sell[:idx].nil?

  # l+1 < sell[:idx] 間の最安値日を調べる
  while l + 1 < sell[:idx]
    l += 1
    if buy[:val] > a[l]
      buy = { idx: l, val: a[l] }
    end
  end

  # 最安値日, 最高値日
  { b_idx: buy[:idx], s_idx: sell[:idx], val: sell[:val] - buy[:val] }
end

n, *m = $stdin.read.split.map(&:to_i)

l = 0
max_profit = { val: 0 }
while l < m.length - 1
  tmp_profit = profit(l, m)
  p [l, tmp_profit]

  if tmp_profit
    max_profit = tmp_profit if max_profit[:val] < tmp_profit[:val]
    l = tmp_profit[:s_idx]
  end
  l += 1
end

puts max_profit[:val] > 0 ? [max_profit[:b_idx] + 1, max_profit[:s_idx] + 1] : "No"

# result = { profit: 0 }
# m.each.with_index(1) do |m_i, i|
#   low = { day: i, value: m_i } if m_i < low[:value]
#   high = { day: i, value: m_i } if m_i > high[:value]

#   profit = high[:value] - low[:value]
#   if low[:day] < high[:day] && result[:profit] < profit
#     result = { buy: low[:day], sale: high[:day], profit: profit }
#   end
# end

# puts result[:profit] > 0 ? [result[:buy], result[:sale]] : "No"

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
