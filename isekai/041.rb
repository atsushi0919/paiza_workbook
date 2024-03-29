# 配列の書き換え
# https://paiza.jp/works/mondai/array_primer/array_primer__elm_rewrite

INPUT1=<<"EOS"
3 1 5
1 2 3 4 5
EOS
OUTPUT1=<<"EOS"
1
2
1
4
5
EOS

a,b,_,*c=$<.read.split;puts c.map{|x|x==a ? b : x}

=begin
1 行目に整数 A, B, N が与えられます。
2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
N 個の整数のうち、その数が A だった場合、B に書き換えてください。
書き換えた N 個の整数を改行区切りで出力してください。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

1 行目に整数 A, B, N が与えられます。
2 行目に N 個の整数 a_1, a_2, ..., a_N が与えられます。
以下の形式で標準入力によって与えられます。

A B N

a_1 a_2 ... a_N
条件
・A, B, N は 1 以上 10 以下の整数
・a_i (1 ≦ i ≦ N) は 1 以上 10 以下の整数

出力される値
N 個の整数の内、その数が A だった場合、B に書き換えてください。
書き換えた N 個の整数を改行区切りで出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

a_1

a_2

...

a_N

入力例
3 1 5
1 2 3 4 5
出力例
1
2
1
4
5
=end