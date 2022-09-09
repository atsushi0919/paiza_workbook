# Top - k (easy) (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_simple_step2

INPUT1 = <<~"EOS"
  5 2
  1 3 5 7 9
EOS
OUTPUT1 = <<~"EOS"
  7
EOS

INPUT2 = <<~"EOS"
  5 2
  4 9 9 1 2
EOS
OUTPUT2 = <<~"EOS"
  9
EOS

INPUT3 = <<~"EOS"
  1 1
  100
EOS
OUTPUT3 = <<~"EOS"
  100
EOS

_, k, *a = STDIN.read.split.map(&:to_i)
puts a.sort[-k]
