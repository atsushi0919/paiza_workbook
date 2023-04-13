# 【全探索 4】ストラックアウト (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__struck_out

INPUT1 = <<"EOS"
1 2 3
1 2 3
1 2 3
1 2 3
1 2
1 2 3
1 2
1 2 3 4
1 2
1 2 3
1 2
1 2 3
EOS
OUTPUT1 = <<"EOS"
26
EOS

# bingo を数える
def count_bingo(ary)
  yoko = Array.new(3) { Array.new(3, false) }
  ary.each { |i| yoko[i / 3][i % 3] = true }
  tate = yoko.transpose

  bingo = 0
  naname1 = []
  naname2 = []
  (0..2).each do |i|
    bingo += 1 if yoko[i].all?
    bingo += 1 if tate[i].all?
    naname1 << yoko[i][i]
    naname2 << yoko[2 - i][i]
  end
  bingo += 1 if naname1.all?
  bingo += 1 if naname2.all?

  bingo
end

# 入力
input_lines = $stdin.read.split("\n")
struck_score = input_lines.shift(3).map { |row| row.split.map(&:to_i) }
bingo_score = input_lines.shift(9).map { |row| row.split.map(&:to_i) }

# 探索リスト初期化
max_score = -1
memo = {}
(0..8).to_a.permutation.each do |order|
  opened = []
  score = bingo = 0
  idx = 6
  while idx >= 0
    # 探索済みの score, bingo はメモから持ってくる
    if memo[order[..idx]]
      opened = order[..idx]
      score = memo[order[..idx]][:score]
      bingo = memo[order[..idx]][:bingo]
      break
    end
    idx -= 1
  end
  # 未探索部分の score 計算
  order = order[idx + 1..]
  while order.length > 0
    num = order.shift
    score += struck_score[num / 3][num % 3]
    opened += [num]
    # bingo を調べる
    if opened.length > 2
      new_bingo = count_bingo(opened) - bingo
      if new_bingo > 0
        score += bingo_score[num][new_bingo - 1]
        bingo += new_bingo
      end
    end
    # score, bingo をメモする
    if opened.length < 7
      memo[opened] = {
        score: score,
        bingo: bingo,
      }
    end
  end
  # 最大得点更新
  max_score = [score, max_score].max
end

# 出力
puts max_score

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
バッティングセンターに通っている paiza 君はそこに置いてある 1〜9 が以下のように配置されたストラックアウトに興味を持ちました。

123
456
789

ストラックアウトには得点が設定されており、店内ランキングが存在します。
ランキングで一位になりたいと考えた paiza 君はストラックアウトで獲得できる最高得点を求めようと考えました。
得点は次のように計算されます。初め得点は 0 点からスタートします。
・数字 i のパネルを倒すと s_i 点が加算される。
・数字 i のパネルを倒すことで新たに j 個のビンゴができたとき、b_i_j 点が加算される。
・n (1 < n) 個ビンゴができた場合であっても、加算されるのは b_i_n のみ。
(b_i_{n-1} などは加算されない)

獲得できる得点の最大値を求めてください。
なお、一度倒したパネルを再度倒すことはできないことに注意してください。
▼　下記解答欄にコードを記入してみよう

入力される値
s_1 s_2 s_3
s_4 s_5 s_6
s_7 s_8 s_9
b_1_1 b_1_2 b_1_3
b_2_1 b_2_2
b_3_1 b_3_2 b_3_3
b_4_1 b_4_2
b_5_1 b_5_2 b_5_3 b_5_4
b_6_1 b_6_2
b_7_1 b_7_2 b_7_3
b_8_1 b_8_2
b_9_1 b_9_2 b_9_3

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
獲得できる得点の最大値を出力してください。

条件
・1 ≦ s_i ≦ 100 (1 ≦ i ≦ 9)
・1 ≦ b_i_j ≦ 1000 (1 ≦ i ≦ 9, 1 ≦ j ≦ 4)

入力例1
1 2 3
1 2 3
1 2 3
1 2 3
1 2
1 2 3
1 2
1 2 3 4
1 2
1 2 3
1 2
1 2 3

出力例1
26
=end
