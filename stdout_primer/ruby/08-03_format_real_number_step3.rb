# 1 つの実数を出力 3 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__format_real_number_step3

# 入出力例
INPUT1 = <<~"EOS"
  0.813
EOS
OUTPUT1 = <<~"EOS"
  0.813
EOS

INPUT2 = <<~"EOS"
  8.13
EOS
OUTPUT2 = <<~"EOS"
  8.130
EOS

INPUT3 = <<~"EOS"
  3.141692
EOS
OUTPUT3 = <<~"EOS"
  3.142
EOS

# 解答例1
d = 3
# 入力
n = gets.to_f
# 小数第 d 位に丸める
# n = n.round(d)
# 出力
puts("%.#{d}f" % n)

# 解答例3
d = 3
# 入力
n = gets.to_f
# 小数第 d 位に丸める
# n = n.round(d)
# 出力
puts(format("%.*f", d, n))

# 解答例4
d = 3
# 入力
n = gets.to_f
# 出力
puts(format("%.*f", d, n))

# 解答例4
d = 3
# 入力
n = gets.to_f
# 小数第 d 位に丸める
n = (n * 10 ** d + 0.5).to_i / 10.0 ** d
# 整数部と小数部の文字列にして分ける
int_part, dec_part = n.to_s.split(".")
# 小数部の 0 が足りないなら追加する
dec_part += "0" * (d - dec_part.length)
# 出力
puts("#{int_part}.#{dec_part}")
