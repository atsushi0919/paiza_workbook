# 【部分和】部分和問題 4 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_partial_sums_boss

def solve(input_data)
  input_data = input_data.split("\n")
  n, x = input_data.shift.split.map(&:to_i)
  *a = input_data.map(&:to_i)

  dp = [1] + [0] * x
  (0...n).each do |i|
    (a[i]..x).each do |j|
      dp[j] += dp[j - a[i]]
    end
  end
  dp[-1] > 0 ? "yes" : "no"
end

#puts solve(STDIN.read)

in1 = <<~"EOS"
  5 10
  9
  3
  4
  11
  8
EOS
ans1 = "yes"
puts solve(in1)

=begin
1 ~ n の番号がついた n 種類のおもりがあり、おもり i の重さは a_i です。
それぞれのおもりは無限個存在しており、任意のおもりを任意の個数使うことができます。
このとき、おもりを選んで重さの和を x となるようにすることができるかどうか判定してください。
=end
