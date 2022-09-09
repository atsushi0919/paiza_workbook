# プログラミングレベル (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step1

INPUT1 = <<~"EOS"
  5
  3 1 4 2 5
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  1
  100
EOS
OUTPUT2 = <<~"EOS"
  No
EOS

_, *a = STDIN.read.split.map(&:to_i)
a.sort!
if a[0] == 1
  puts a.each_cons(2).all? { |a, b| a + 1 >= b } ? "Yes" : "No"
else
  puts "No"
end
