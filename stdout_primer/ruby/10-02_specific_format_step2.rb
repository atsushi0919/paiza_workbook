# 文字列と N 個の整数の出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_format_step2

# 入出力例
INPUT1 = <<~"EOS"
  3 10 99
EOS
OUTPUT1 = <<~"EOS"
  (10, 99), (10, 99), (10, 99)
EOS

INPUT2 = <<~"EOS"
  2 33 44
EOS
OUTPUT2 = <<~"EOS"
  (33, 44), (33, 44)
EOS

# 解答例1
# 入力
n, a, b = gets.split.map(&:to_i)
# "(a, b)" 形式の文字列を生成
s = "(#{a}, #{b})"
# 要素 s が n 個の配列を生成
ary = [s] * n
# 出力
puts(ary.join(", "))

# 解答例2
# 入力
n, a, b = gets.split.map(&:to_i)
# 出力
puts (["(#{a}, #{b})"] * n).join(", ")
