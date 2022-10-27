# ピクニック (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__matrix_step2

INPUT1 = <<~"EOS"
  2 3
  1 2 2
  3 2 2
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  2 3
  2 2 2
  2 2 2
EOS
OUTPUT2 = <<~"EOS"
  2
EOS

INPUT3 = <<~"EOS"
  1 4
  1 1 1 1
EOS
OUTPUT3 = <<~"EOS"
  0
EOS

INPUT4 = <<~"EOS"
  3 3
  2 2 2
  2 2 2
  1 2 2
EOS
OUTPUT4 = <<~"EOS"
  3
EOS

def flat?(a, y, x, size)
  base_h = a[y][x]
  0.upto(size - 1) do |dy|
    unless a[y + dy][x..x + size - 1].all?(base_h)
      return false
    end
  end
  true
end

size = 2
input_lines = STDIN.read.split("\n")
n, m = input_lines.shift.split.map(&:to_i)
a = input_lines.map { |l| l.split.map(&:to_i) }

cand_count = 0
0.upto(n - size) do |i|
  0.upto(m - size) do |j|
    cand_count += 1 if flat?(a, i, j, size)
  end
end

puts cand_count
