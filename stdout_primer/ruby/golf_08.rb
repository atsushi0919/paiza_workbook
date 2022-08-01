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

# $> << INPUT1.split[1..].map { |s| /\./ =~ s ? s.to_f : s.to_i }.each_slice(2).map { |f, d| ("%.#{d}f" % f.round(d)) }.join("\n")

$> << $<.read.split[1..].map { |s| /\./ =~ s ? s.to_f : s.to_i }.each_slice(2).map { |f, d| ("%.#{d}f" % f.round(d)) }.join("\n")

# $><<$<.read.split[1..].map{|s|/\./ =~ s ?s.to_f: s.to_i}.each_slice(2).map{|f,d|"%.#{d}f"%f.round(d)}.join("\n")
