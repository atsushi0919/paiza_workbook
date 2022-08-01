# 階段の上り方 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_stairs_step1

INPUT1 = <<~"EOS"
  11 3 4
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

def solve(input_data)
  n, a, b = input_data.split.map(&:to_i)

  # dpテーブル初期化
  # 0段目には上らなくても到達できる
  dp = [1] + [0] * n

  # dpテーブル更新
  1.upto(n) do |i|
    # i-a 段目から a 段上って i 段へ到達
    dp[i] += dp[i - a] if i >= a
    # i-b 段目から b 段上って i 段へ到達
    dp[i] += dp[i - b] if i >= b
    p [i, dp]
  end

  # n 段目に行く経路数を返す
  dp[n]
end

#puts solve(STDIN.read)

# 確認用コード
p solve(INPUT1)
# > 3
