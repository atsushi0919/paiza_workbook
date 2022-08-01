# 【実数をフォーマット指定して出力】複数の実数を出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__format_real_number_boss

# 入出力例
INPUT1 = <<~"EOS"
  4
  0.813 1
  0.813 2
  0.813 3
  0.813 4
EOS
OUTPUT1 = <<~"EOS"
  0.8
  0.81
  0.813
  0.8130
EOS

# 解答例1
# 入力
q = gets.to_i
ary = q.times.map do
  n, m = gets.split
  [n.to_f, m.to_i]
end
# 出力
ary.each { |n, m| puts("%.#{m}f" % n.round(m)) }

# 解答例2
# 入力
q = gets.to_i
ary = q.times.map do
  n, m = gets.split
  [n.to_f, m.to_i]
end
# 出力
ary.each { |n, m| puts(format("%.*f", m, n.round(m))) }

# 解答例3
# 入力
q = gets.to_i
ary = q.times.map do
  n, m = gets.split
  [n.to_f, m.to_i]
end
# ary の先頭から順に繰り返す
ary.each do |n, m|
  # 小数第3位に丸める
  n = (n * 10 ** m + 0.5).to_i / 10.0 ** m
  # 整数部と小数部の文字列にして分ける
  int_part, dec_part = n.to_s.split(".")
  # 小数部の 0 が足りないなら追加する
  dec_part += "0" * (m - dec_part.length)
  # 出力
  puts("#{int_part}.#{dec_part}")
end
