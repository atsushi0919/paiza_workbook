# 3 行 3 列の整数の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__matrix_data_step1

# 入出力例
INPUT1 = <<~"EOS"
  8 1 3
  1 2 3
  3 1 8
EOS
OUTPUT1 = <<~"EOS"
  8 1 3
  1 2 3
  3 1 8
EOS

# 解答例1
h = 3
# 入力
ary = h.times.map { gets.split.map(&:to_i) }
# 出力
puts(ary.map { |row| row.join(" ") }.join("\n"))

# 解答例2
h = 3
# 入力
ary = []
h.times do
  # 1行分の要素を半角スペースで分割
  row = gets.split.map(&:to_i)
  # ary に追加
  ary.push(row)
end
# 出力
ary.each do |row|
  puts(row.join(" "))
end
