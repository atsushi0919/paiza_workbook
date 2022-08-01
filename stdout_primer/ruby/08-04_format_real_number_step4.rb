# 1 つの実数を出力 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__format_real_number_step4

# 入出力例
INPUT1 = <<~"EOS"
  0.813 1
EOS
OUTPUT1 = <<~"EOS"
  0.8
EOS

INPUT2 = <<~"EOS"
  0.813 2
EOS
OUTPUT2 = <<~"EOS"
  0.81
EOS

INPUT3 = <<~"EOS"
  0.813 3
EOS
OUTPUT3 = <<~"EOS"
  0.813
EOS

INPUT4 = <<~"EOS"
  0.813 4
EOS
OUTPUT4 = <<~"EOS"
  0.8130
EOS

# 解答例1
# 入力
n, m = gets.split
n = n.to_f
m = m.to_i
# 小数第 m 位に丸める
n = n.round(m)
# 出力
puts("%.#{m}f" % n)

# 解答例2
# 入力
n, m = gets.split
n = n.to_f
m = m.to_i
# 小数第 m 位に丸める
n = n.round(m)
# 出力
puts(format("%.*f", m, n))

# 解答例3
# 入力
n, m = gets.split
n = n.to_f
m = m.to_i
# 小数第3位に丸める
n = (n * 10 ** m + 0.5).to_i / 10.0 ** m
# 整数部と小数部の文字列にして分ける
int_part, dec_part = n.to_s.split(".")
# 小数部の 0 が足りないなら追加する
dec_part += "0" * (m - dec_part.length)
# 出力
puts("#{int_part}.#{dec_part}")
