# N 組の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__pair_data_step2

# 入出力例
INPUT1 = <<~"EOS"
  5
  813 813
  8 13
  81 1
  81 3
  8 813
EOS
OUTPUT1 = <<~"EOS"
  813 813
  8 13
  81 1
  81 3
  8 813
EOS

# 解答例1
# 1 行目入力
n = gets.to_i
# 続く n 行入力
pairs = n.times.map { gets.split.map(&:to_i) }
# 出力
pairs.each { |pair| puts(pair.join(" ")) }

# 解答例2
# 1 行目入力
n = gets.to_i
# 続く n 行入力
pairs = []
n.times do
  # 半角スペースで分割して整数型に変換する
  pair = gets.split.map(&:to_i)
  # pairs に pair を追加する
  pairs.push(pair)
end
# 出力
pairs.each do |pair|
  puts(pair.join(" "))
end
