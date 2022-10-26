# 部分列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__before_after_boss

INPUT1 = <<~"EOS"
  7 7
  -20 -85 -48 97 -86 83 -11
  85 22 49 -88 -2 -31 -92
EOS
OUTPUT1 = <<~"EOS"
  No
EOS

INPUT2 = <<~"EOS"
  2 2
  -30 97
  -30 97
EOS
OUTPUT2 = <<~"EOS"
  Yes
EOS

INPUT3 = <<~"EOS"
  1 1
  -69
  -19
EOS
OUTPUT3 = <<~"EOS"
  No
EOS

input_lines = STDIN.read.split("\n")
_, m = input_lines.shift.split.map(&:to_i)
a = input_lines.shift.split.map(&:to_i)
b = input_lines.shift.split.map(&:to_i)

subseq = true
l = 0
b.each do |e_b|
  next_l = a[l..].index(e_b)
  if next_l
    l = next_l
  else
    subseq = false
    break
  end
end

puts subseq ? "Yes" : "No"
