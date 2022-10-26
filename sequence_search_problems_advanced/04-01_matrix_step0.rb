# 二次元データ 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__matrix_step0

INPUT1 = <<~"EOS"
  2 3
  a.b
  .c.
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  1 1
  .
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

_, _, *a = STDIN.read.split

puts a.map { |s| s.count(".") }.sum

=begin

整数 n, m と、 n 個の各 m 文字の文字列 s_1, ... , s_n が与えられます。
s_1, ... , s_n それぞれに含まれる文字 . の数を計算し、その合計を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n m
s_1
s_2
...
s_n


・ 1 行目に、文字列の個数を表す整数 n と各文字列の長さ m が与えられます。
・ 2 行目から n + 1 行目にかけて、文字列 s_i が改行区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
文字 . の個数の合計を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ n, m ≦ 100
・ s_i はアルファベット小文字または文字 . のみで構成される文字列

入力例1
2 3
a.b
.c.

出力例1
3

入力例2
1 1
.

出力例2
1
=end
