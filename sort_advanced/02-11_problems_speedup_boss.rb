# ソートによる高速化まとめ (paizaランク B 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_boss

INPUT1 = <<~"EOS"
  6 4
  6 5 4 3 2 1
  get 1 0
  update 6 7
  get 1 0
  get 6 0
EOS
OUTPUT1 = <<~"EOS"
  6
  7
  2
EOS

input_lines = STDIN.read.split("\n")
input_lines.shift
a = input_lines.shift.split.map(&:to_i)
queries = input_lines.map do |line|
  q, k, x = line.split
  [q, k.to_i, x.to_i]
end

res = []
queries.each do |q, k, x|
  case q
  when "update"
    a[k - 1] = x
  when "get"
    res << a.sort[-k]
  end
end

puts res.join("\n")
