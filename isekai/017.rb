# 行列の転置
# https://paiza.jp/works/mondai/double_roop_problems/double_roop_problems__transposition

INPUT1 = <<"EOS"
2 3
1 2 3
4 5 6
EOS
OUTPUT1 = <<"EOS"
1 4
2 5
3 6
EOS

_,*a=$<.read.split("\n").map{|l|l.split.map &:to_i}
puts a.transpose.map{|l|l.join " "}

=begin
N 行 K 列の行列 A の i 行 j 列 の要素 A_ij を A_ji とした K 行 N 列の行列を元の配列 A の転置行列と言います。

例として、

1 2 3

4 5 6

7 8 9
の転置行列は

1 4 7

2 5 8

3 6 9
です。

行列 A についての情報が与えられるので、A の転置行列を出力してください。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

N K

A_11 A_12 ... A_1K

...

A_N1 A_N2 ... A_NK
・ 1 行目では行列の行数 N と列数 K が半角スペース区切りで与えられます。
・ 続く N 行では、A の各要素 A_ij (1 ≦ j ≦ Ki) が半角スペース区切りで与えられます。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 1 ≦ N , K ≦ 100
・ 0 ≦ A_ij ≦ 100 (1 ≦ i ≦ N , 1 ≦ j ≦ K)

出力される値
A の転置行列の各要素を入力の A と同様の形式で出力してください。
出力の末尾には改行を入れてください。

入力例
2 3
1 2 3
4 5 6
出力例
1 4
2 5
3 6
=end
