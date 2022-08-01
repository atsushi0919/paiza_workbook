# 【行入力】1,000 行の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_boss

# 入出力例
INPUT1 = <<~"EOS"
  paiza0
  paiza1
  ・
  省略
  ・
  paiza998
  paiza999
EOS
OUTPUT1 = <<~"EOS"
  paiza0
  paiza1
  ・
  省略
  ・
  paiza998
  paiza999
EOS

# 解答例1
n = 1000
# n = 1000 行分の入力を配列 ary に格納
ary = []
n.times do
  # 配列末尾に入力文字列を追加する
  ary.push(gets.chomp)
end
# 配列の先頭から順番に出力
puts(ary)

# 解答例2
n = 1000
# n = 1000 行分の入力を出力する
n.times do
  # 1行分の入力受け取り
  s = gets.chomp
  # 出力
  puts(s)
end
