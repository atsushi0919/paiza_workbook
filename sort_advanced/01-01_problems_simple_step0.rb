# ソートの基本 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_simple_step0

INPUT1 = <<~"EOS"
  5
  1 3 5 7 9
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  5
  4 3 5 1 9
EOS
OUTPUT2 = <<~"EOS"
  No
EOS
INPUT3 = <<~"EOS"
  1
  100
EOS
OUTPUT3 = <<~"EOS"
  Yes
EOS

_, *a = STDIN.read.split.map(&:to_i)
puts a.each_cons(2).all? { |a, b| a <= b } ? "Yes" : "No"
