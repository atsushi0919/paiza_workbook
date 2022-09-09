# タプルソート (paizaランク B 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step5

INPUT1 = <<~"EOS"
  4 3 3
  10 100 1 2000
  10 100 11 1000
  10 200 2 1000
  20 200 1 1000
EOS
OUTPUT1 = <<~"EOS"
  10 100 1
  11 1000 10
  2000 10 100
  200 2 1000
EOS

INPUT2 = <<~"EOS"
  4 2 2
  1 1
  1 1
  1 3
  1 2
EOS
OUTPUT2 = <<~"EOS"
  1 1
  1 1
  1 2
  1 3 
EOS

input_lines = STDIN.read.split("\n")
*_, k = input_lines.shift.split.map(&:to_i)
a = input_lines.map { |line| line.split.map(&:to_i) }

a.sort!.sort_by! { |x| x[k - 1] }
puts a.map { |line| line.join(" ") }.join("\n")
