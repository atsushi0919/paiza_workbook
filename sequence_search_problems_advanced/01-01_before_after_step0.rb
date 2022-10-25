# 前後関係の基本 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__before_after_step0

INPUT1 = <<~"EOS"
  3
  1 -4 -4
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  5
  0 0 0 -1 5
EOS
OUTPUT2 = <<~"EOS"
  2
EOS

_, *a = STDIN.read.split.map(&:to_i)

puts a.each_cons(2).count { |a, b| a == b }

=begin
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 n と、数列 a_1, ... , a_n が与えられます。

a_i = a_{ i + 1 } となる i ( 1 ≦ i < n) の個数を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
a_1 a_2 ... a_n


・ 1 行目に、数列の長さを表す整数 n が与えられます。
・ 2 行目に、数列の値 a_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
a_i = a_{ i + 1 } となる i の個数を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ n ≦ 1,000
・ - 100 ≦ a_i ≦ 100

入力例1
3
1 -4 -4

出力例1
1

入力例2
5
0 0 0 -1 5

出力例2
2
=end
