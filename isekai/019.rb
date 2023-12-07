# 素数の個数
# https://paiza.jp/works/mondai/double_roop_problems/double_roop_problems__prime_number_easy

require "prime"
n=gets.to_i
p (2..n).count{|x|x.prime?}

=begin
整数 N が与えられるので、2 以上 N 以下の素数の個数を求めてください。
素数とはの約数が 1 と X のみであるような整数 X のことを指します。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

N
・ 整数 N が 1 行で与えられます。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 2 ≦ N ≦ 1000 (1 ≦ i ≦ N)

出力される値
2 以上 N 以下の素数の数を 1 行で出力してください。
出力の末尾には改行を入れてください。

入力例

3

出力例

2
=end
