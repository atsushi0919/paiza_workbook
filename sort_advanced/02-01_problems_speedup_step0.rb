# Top - k (hard) (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step0

INPUT1 = <<~"EOS"
  6 3
  11 9 7 5 3 1
  1 2 3
EOS
OUTPUT1 = <<~"EOS"
  11
  9
  7
EOS

INPUT2 = <<~"EOS"
  5 6
  3 5 7 9 11
  1 2 3 2 5 4
EOS
OUTPUT2 = <<~"EOS"
  11
  9
  7
  9
  3
  5 
EOS

input_lines = STDIN.split("\n")
n, q = input_lines.shift.split.map(&:to_i)
a, k = input_lines.map { |line| line.split.map(&:to_i) }
a.sort!

puts k.map { |i| a[-i] }

=begin

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 n, q と、数列 a_1, ..., a_n と数列 k_1, ..., k_q が与えられます。
1 以上 q 以下の各 i について、 a の k_i 番目に大きい値をそれぞれ求め、改行区切りで出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n q
a_1 a_2 ... a_n
k_1 k_2 ... k_q


・ 1 行目に、数列の長さを表す整数 n, q が与えられます。
・ 2 行目に、数列の値 a_i が半角スペース区切りで与えられます。
・ 3 行目に、数列の値 k_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 以上 n 以下の各 i について、 a の k_i 番目に大きい値をそれぞれ求め、改行区切りで出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ n, q ≦ 500,000
・ 0 ≦ a_i < 100
・ 1 ≦ k_i ≦ n

入力例1
6 3
11 9 7 5 3 1
1 2 3

出力例1
11
9
7

入力例2
5 6
3 5 7 9 11
1 2 3 2 5 4

出力例2
11
9
7
9
3
5 
=end
