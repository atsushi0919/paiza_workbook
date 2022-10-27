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

input_lines = STDIN.read.split("\n")
n, m, k, x = input_lines.shift.split.map(&:to_i)
a = input_lines.map { |l| l.split.map(&:to_i) }

s = Array.new(n + 1) { Array.new(m + 1, 0) }
0.upto(n - 1) do |i|
  0.upto(m - 1) do |j|
    not_put = a[i][j] > x ? 1 : 0
    s[i + 1][j + 1] = not_put + s[i][j + 1] + s[i + 1][j] - s[i][j]
  end
end

cand_count = 0
0.upto(n - k) do |i|
  0.upto(m - k) do |j|
    if s[i + k][j + k] - s[i][j + k] - s[i + k][j] + s[i][j] == 0
      cand_count += 1
    end
  end
end

puts cand_count
