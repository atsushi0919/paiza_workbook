# 文字列と整数の組の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__pair_data_step4

# 入出力例
INPUT1 = <<~"EOS"
  5
  paiza 813
  pa 81
  8pa 13
  iza 8
  pa 13
EOS
OUTPUT1 = <<~"EOS"
  paiza 813
  pa 81
  8pa 13
  iza 8
  pa 13
EOS

# 解答例1
# 1 行目入力
n = gets.to_i
# 続く n 行入力
pairs = n.times.map do
  s, a = gets.split
  [s, a.to_i]
end
# 出力
pairs.each { |pair| puts(pair.join(" ")) }

# 解答例2
# 1 行目入力
n = gets.to_i
# 続く n 行入力
pairs = []
n.times do
  s, a = gets.split
  pairs.push([s, a.to_i])
end
# 出力
pairs.each do |pair|
  puts(pair.join(" "))
end
