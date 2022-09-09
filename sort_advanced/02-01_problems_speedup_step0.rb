# Top - k (hard) (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step0

INPUT1 = <<~"EOS"
  6 3
  11 9 7 5 3 1
  1 2 3
EOS
OUTPUT1 = <<~"EOS"
  11
  9
  7
EOS

INPUT2 = <<~"EOS"
  5 6
  3 5 7 9 11
  1 2 3 2 5 4
EOS
OUTPUT2 = <<~"EOS"
  11
  9
  7
  9
  3
  5 
EOS

input_lines = STDIN.split("\n")
n, q = input_lines.shift.split.map(&:to_i)
a, k = input_lines.map { |line| line.split.map(&:to_i) }
a.sort!

puts k.map { |i| a[-i] }
