# 階段の上り方 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_stairs_boss

INPUT1 = <<~"EOS"
  10 2 3 4
EOS
OUTPUT1 = <<~"EOS"
  17
EOS

def solve(input_data)
  n, a, b, c = input_data.split.map(&:to_i)

  # dpテーブル初期化
  # 0段目には上らなくても到達できる
  dp = [1] + [0] * n

  # dpテーブル更新
  1.upto(n) do |i|
    # i-a 段目から a 段上って i 段へ到達
    dp[i] += dp[i - a] if i >= a
    # i-b 段目から b 段上って i 段へ到達
    dp[i] += dp[i - b] if i >= b
    # i-c 段目から c 段上って i 段へ到達
    dp[i] += dp[i - c] if i >= c
    p [i, dp]
  end

  # n 段目に行く経路数を返す
  dp[n].to_s << "\n"
end

puts solve(INPUT1)
