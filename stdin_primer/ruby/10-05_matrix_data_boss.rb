# 【N 行 M 列のデータの入力】行ごとに要素数の異なる整数列の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__matrix_data_boss

# 入出力例
INPUT1 = <<~"EOS"
  3
  1 8
  2 8 1
  3 8 1 3
EOS
OUTPUT1 = <<~"EOS"
  8
  8 1
  8 1 3
EOS

# 解答例
# 1 行目入力
n = gets.to_i
# 続く n 行入力
ary = n.times.map { gets.split[1..].map(&:to_i) }
# 出力
puts(ary.map { |row| row.join(" ") }.join("\n"))

# 解答例2
# 1 行目入力
n = gets.to_i
# 続く n 行入力
ary = []
n.times do
  # 1行分の要素を半角スペースで分割
  # 1個目の要素を m , 2個目以降の要素を row に格納
  m, *row = gets.split.map(&:to_i)
  # ary に追加
  ary.push(row)
end
# 出力
ary.each do |row|
  puts(row.join(" "))
end
