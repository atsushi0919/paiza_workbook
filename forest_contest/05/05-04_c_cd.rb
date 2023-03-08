# CD (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__d_cd

INPUT1 = <<"EOS"
15
1 7
5 22
5 23
5 4
4 30
3 58
3 55
4 17
3 30
5 0
3 53
3 38
5 25
4 14
7 16
EOS

OUTPUT1 = <<"EOS"
Yes
EOS

# # 解答例1-1
# MAX_RECORDING_SEC = 60 * 74  # 4440 秒
# n = gets.to_i

# total_sec = 0
# n.times do
#   m, s = gets.split.map(&:to_i)
#   total_sec += 60 * m + s
# end

# if total_sec <= MAX_RECORDING_SEC
#   puts "Yes"
# else
#   puts "No"
# end

# # 解答例1-2
# MAX_RECORDING_SEC = 60 * 74  # 4440 秒
# _, *songs = $stdin.read.split("\n").map { |r| r.split.map(&:to_i) }

# total_sec = songs.map { |m, s| 60 * m + s }.sum

# puts total_sec <= MAX_RECORDING_SEC ? "Yes" : "No"

# # 解答例2
# MAX_RECORDING_SEC = 60 * 74  # 4440 秒
# _, *songs = INPUT1.split("\n").map { |r| r.split.map(&:to_i) }
# # _, *songs = $stdin.read.split("\n").map { |r| r.split.map(&:to_i) }

# m, s = songs.transpose.map { |a| a.inject(:+) }
# total_sec = 60 * m + s

# puts total_sec <= MAX_RECORDING_SEC ? "Yes" : "No"

=begin
CD (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__d_cd
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
あなたはオリジナルの CD を作ろうとしています。CD の最大収録時間は 74 分です。
あなたが CD に入れたいと思っている曲は n 曲あり、i (1 ≦ i ≦ n) 曲目の長さは m_i 分 s_i 秒です。
n 曲すべてを 1 枚の CD に収録することができるかどうかを調べてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
m_1 s_1
m_2 s_2
...
m_n s_n

・ 1 行目に、曲の数 n が整数で与えられます。
・ 続く n 行のうち i (1 ≦ i ≦ n) 行目には、i 曲目の長さを表す整数 m_i と s_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
n 曲すべてを 1 枚の CD に収録することができるなら Yes と、できないなら No と 1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 1 ≦ n ≦ 20
・ 0 ≦ m_i, s_i < 60 (1 ≦ i ≦ n)

入力例1
15
1 7
5 22
5 23
5 4
4 30
3 58
3 55
4 17
3 30
5 0
3 53
3 38
5 25
4 14
7 16

出力例1
Yes
=end
