# 二次元データ 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__matrix_step1

INPUT1 = <<~"EOS"
  2 3 3
  1 2 3
  3 4 5
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  1 1 2
  1
EOS
OUTPUT2 = <<~"EOS"
  0
EOS

input_lines = STDIN.read.split("\n")
_, _, k = input_lines.shift.split.map(&:to_i)
a = input_lines.map { |l| l.split.map(&:to_i) }

puts a.map { |l| l.count(k) }.sum

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 n, m, k と、 n 個の各 m 要素の数列の要素 a_1_1, a_1_2, ... a_n_m が与えられます。
a_i_j ( 1 ≦ i ≦ n, 1 ≦ j ≦ m) に含まれる数値 k の個数を計算し、その合計を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n m k
a_1_1 a_1_2 ... a_1_m
a_2_1 a_2_2 ... a_2_m
...
a_n_1 a_n_2 ... a_n_m


・ 1 行目に、数列の個数を表す整数 n と各数列の長さ m と数値 k が与えられます。
・ 2 行目から n + 1 行目にかけて、数列 a_i_j の各要素が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
a に含まれる数値 k の個数を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ n, m, k ≦ 100
・ 1 ≦ a_i_j ≦ 100

入力例1
2 3 3
1 2 3
3 4 5

出力例1
2

入力例2
1 1 2
1

出力例2
0
=end
