# 二次元データの区間探索 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__matrix_boss

INPUT1 = <<~"EOS"
  2 3 2 4
  1 2 3
  3 4 5
EOS
OUTPUT1 = <<~"EOS"
  1
EOS
INPUT2 = <<~"EOS"
  2 3 1 3
  1 2 3
  3 4 5
EOS
OUTPUT2 = <<~"EOS"
  4
EOS

def can_put?(a, y, x, size, reserve)
  0.upto(size - 1) do |dy|
    if a[y + dy][x..x + size - 1].find { |v| v > reserve }
      return false
    end
  end
  true
end

input_lines = STDIN.read.split("\n")
n, m, k, x = input_lines.shift.split.map(&:to_i)
a = input_lines.map { |l| l.split.map(&:to_i) }

cand_count = 0
0.upto(n - k) do |i|
  0.upto(m - k) do |j|
    cand_count += 1 if can_put?(a, i, j, k, x)
  end
end

puts cand_count
