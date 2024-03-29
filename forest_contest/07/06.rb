# 最も大きな最大公約数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_007/forest_contest_007__max_gcd

INPUT1 = <<"EOS"
6
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
17
EOS
OUTPUT2 = <<"EOS"
8
EOS

# # 解答例1-1
# def get_gcd(a, b)
#   a, b = b, a if a < b
#   t = a % b
#   while t != 0
#     a = b
#     b = t
#     t = a % b
#   end
#   b
# end

# n = gets.to_i

# max_gcd = -1
# 1.upto(n - 1) do |a|
#   (i + 1).upto(n) do |b|
#     max_gcd = [max_gcd, get_gcd(a, b)].max
#   end
# end

# puts max_gcd

# 解答例1-2
n = gets.to_i

max_gcd = -1
(1..n).to_a.combination(2).each do |a, b|
  p [a, b]
  max_gcd = [max_gcd, a.gcd(b)].max
end

puts max_gcd

# 解答例2
# puts gets.to_i / 2

=begin
入力として自然数 n が与えられます。1 から n までの範囲にある全ての異なる整数の組のうち、最も大きな最大公約数を求めてください。
つまり、 1 ≦ a < b ≦ n を満たすようなすべての gcd(a, b) の中で最も大きな値を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n


・ 1 行目に、自然数 n が入力されます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 から n までの範囲にある全ての異なる整数の組のうち、最も大きな最大公約数を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ n ≦ 100

入力例1
6

出力例1
3

入力例2
17

出力例2
8
=end
