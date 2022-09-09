# 部分列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step3

INPUT1 = <<~"EOS"
  4 12
  5 3 6 2
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  4 17
  5 3 6 2
EOS
OUTPUT2 = <<~"EOS"
  -1
EOS

INPUT3 = <<~"EOS"
  4 200000000000
  1000000 1000000 1000000 1000000
EOS
OUTPUT3 = <<~"EOS"
  -1
EOS

n, x, *a = STDIN.read.split.map(&:to_i)
a.sort!.reverse!

res = -1
partial_sum = 0
0.upto(n - 1) do |i|
  partial_sum += a[i]
  if partial_sum >= x
    res = i + 1
    break
  end
end

puts res
