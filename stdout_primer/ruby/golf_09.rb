# 【出力幅を指定して出力】N 個の数値を M けた半角スペース埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_boss

# 入出力例
INPUT1 = <<~"EOS"
  4 3
  0
  8
  81
  813
EOS
OUTPUT1 = <<~"EOS"
  0
  8
  81
  813
EOS

_, m, *a = INPUT1.split.map(&:to_i); $> << (a.map { |n| "%#{m}d" % n }.join("\n"))

# _,m,*a=$<.read.split.map &:to_i;$><<(a.map{|n|"%#{m}d"%n}.join"\n")
