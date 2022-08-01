# 10 行の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_step4

# 入出力例
INPUT1 = <<~"EOS"
  one
  two
  three
  four
  five
  six
  seven
  eight
  nine
  ten
EOS
OUTPUT1 = <<~"EOS"
  one
  two
  three
  four
  five
  six
  seven
  eight
  nine
  ten
EOS

# 解答例1
n = 10
# n = 10 行分の入力を配列 ary に格納
ary = []
n.times do
  # 配列末尾に入力文字列を追加する
  ary.push(gets.chomp)
end
# 配列の先頭から順番に出力
puts(ary)

# 解答例2
n = 10
# n = 10 行分の入力を出力する
n.times do
  # 1行分の入力受け取り
  s = gets.chomp
  # 出力
  puts(s)
end

# 解答例3
# 入力
s0 = gets.chomp
s1 = gets.chomp
s2 = gets.chomp
s3 = gets.chomp
s4 = gets.chomp
s5 = gets.chomp
s6 = gets.chomp
s7 = gets.chomp
s8 = gets.chomp
s9 = gets.chomp
# 出力
puts(s0)
ptus(s1)
ptus(s2)
ptus(s3)
ptus(s4)
ptus(s5)
ptus(s6)
ptus(s7)
ptus(s8)
ptus(s9)
