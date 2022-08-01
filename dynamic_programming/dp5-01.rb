# 最長部分増加列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_lis_step0

INPUT1 = <<~"EOS"
  5
  100
  102
  101
  91
  199
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

def solve(input_lines)
  # 入力受け取り
  n, *a = input_lines.split("\n").map(&:to_i)

  # dpテーブル初期化
  dp = [1] * n

  # dpテーブル更新
  1.upto(n - 1) do |i|
    0.upto(i - 1) do |j|
      if a[j] < a[i]
        # 最後が木 j であるような増加部分列の末尾に木 i をくっつける
        dp[i] = [dp[i], dp[j] + 1].max
      end
    end
  end

  # 最大値を返す
  dp.max
end

puts solve(STDIN.read)

# 確認用コード
# puts solve(INPUT1)
# > 3
