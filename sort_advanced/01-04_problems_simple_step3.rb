# 重複削除 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_simple_step3

INPUT1 = <<~"EOS"
  6
  2 2 2 1 3 3
EOS
OUTPUT1 = <<~"EOS"
  1 2 3
EOS

INPUT2 = <<~"EOS"
  5
  1 1 1 1 1
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

INPUT3 = <<~"EOS"
  1
  100
EOS
OUTPUT3 = <<~"EOS"
  100
EOS

_, *a = STDIN.read.split.map(&:to_i)
puts a.uniq.sort.join(" ")
