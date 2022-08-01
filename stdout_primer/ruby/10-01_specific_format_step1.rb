# 2 つの文字列を出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_format_step1

# 入出力例
INPUT1 = <<~"EOS"
  kirishima
  kyoko
EOS
OUTPUT1 = <<~"EOS"
  kirishima + kyoko = kirishimakyoko
EOS

INPUT2 = <<~"EOS"
  S
  T
EOS
OUTPUT2 = <<~"EOS"
  S + T = ST
EOS

# 解答例1
# 入力
s = gets.chomp
t = gets.chomp
# 出力
puts("#{s} + #{t} = #{s + t}")

# 解答例2
# 入力
s = gets.chomp
t = gets.chomp
# 出力
puts(s + " + " + t + " = " + s + t)
