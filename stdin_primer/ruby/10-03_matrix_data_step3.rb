# 3 行 M 列の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__matrix_data_step3

# 入出力例
INPUT1 = <<~"EOS"
  5
  1 2 3 4 5
  8 1 3 8 1
  813 138 381 183 831
EOS
OUTPUT1 = <<~"EOS"
  1 2 3 4 5
  8 1 3 8 1
  813 138 381 183 831
EOS

# 解答例1
n = 3
# 1 行目入力
m = gets.to_i
# 続く n 行入力
ary = n.times.map { gets.split.map(&:to_i) }
# 出力
puts(ary.map { |row| row.join(" ") }.join("\n"))

# 解答例2
n = 3
# 1 行目入力
m = gets.to_i
# n 行入力
ary = []
n.times do
  # 1行分の要素を半角スペースで分割
  row = gets.split.map(&:to_i)
  # ary に追加
  ary.push(row)
end
# 出力
ary.each do |row|
  puts(row.join(" "))
end
