# 部分和問題 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_partial_sums_step2

def solve(input_data)
  input_data = input_data.split("\n")
  n, x = input_data.shift.split.map(&:to_i)
  *a = input_data.map(&:to_i)

  dp = Array.new(n + 1) { Array.new(x + 1, INF) }
  dp[0][0] = 0
  (0...n).each do |i|
    (0..x).each do |j|
      dp[i + 1][j] = [dp[i + 1][j], dp[i][j]].min
      if j >= a[i]
        dp[i + 1][j] = [dp[i + 1][j], dp[i][j - a[i]] + 1].min
      end
    end
  end
  dp
end

INF = 1.0 / 0
#puts solve(STDIN.read)

in1 = <<~"EOS"
  5 10
  7
  3
  4
  3
  2
EOS
ans1 = 2
p solve(in1)

=begin
1 ~ n の番号がついた n 個のおもりがあり、おもり i の重さは a_i です。
おもりを何個か選んで重さの和が x となるようにする方法を考えたとき、選ぶおもりの個数の最小値を出力してください。
なお、同じおもりを2個以上選ぶことはできません。
なお、重さの和が x となるようにおもりを選ぶ方法が存在しない場合は-1と出力してください。。
=end
