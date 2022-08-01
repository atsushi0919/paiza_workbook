# N 行 M 列の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__matrix_data_step4

# 入出力例
INPUT1 = <<~"EOS"
  2 3
  1 2 3
  8 1 3
EOS
OUTPUT1 = <<~"EOS"
  1 2 3
  8 1 3
EOS

# 解答例
# 1 行目入力
n, m = gets.split.map(&:to_i)
# 続く n 行入力
ary = n.times.map { gets.split.map(&:to_i) }
# 出力
puts(ary.map { |row| row.join(" ") }.join("\n"))

# 解答例2
# 1 行目入力
n, m = gets.split.map(&:to_i)
# 続く n 行入力
ary = []
h.times do
  # 1行分の要素を半角スペースで分割
  row = gets.split.map(&:to_i)
  # ary に追加
  ary.push()
end
# 出力
ary.each do |row|
  puts(row.join(" "))
end
