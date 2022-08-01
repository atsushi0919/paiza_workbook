# 部分和問題 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_partial_sums_step1

def solve(input_data)
  input_data = input_data.split("\n")
  n, x = input_data.shift.split.map(&:to_i)
  *a = input_data.map(&:to_i)

  dp = Array.new(n + 1) { Array.new(x + 1, 0) }
  dp[0][0] = 1
  (0...n).each do |i|
    (0..x).each do |j|
      dp[i + 1][j] += dp[i][j]
      if j >= a[i]
        dp[i + 1][j] += dp[i][j - a[i]]
      end
    end
  end
  dp
end

MOD = 1000000007
#puts solve(STDIN.read)

in1 = <<~"EOS"
  5 10
  7
  3
  4
  3
  2
EOS
ans1 = 3
pp solve(in1)

=begin
1 ~ n の番号がついた n 個のおもりがあり、おもり i の重さは a_i です。
おもりを何個か選んで重さの和が x となるようにする方法が何通りあるか求めてください。
なお、同じおもりを2個以上選ぶことはできません。
重さが同じおもりが複数存在する場合、それらは区別して別のものとして扱うことにします。
答えは非常に大きくなる可能性があるので、答えを 1,000,000,007 で割った余りで出力してください。
=end
