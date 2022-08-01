# 最長減少部分列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_lis_boss

INPUT1 = <<~"EOS"
  5
  109
  110
  108
  103
  100
EOS
OUTPUT1 = <<~"EOS"
  4
EOS

def solve(input_lines)
  # 入力受け取り
  n, *a = input_lines.split("\n").map(&:to_i)

  # dpテーブル初期化
  dp = [1] * n

  # dpテーブル更新
  1.upto(n - 1).each do |i|
    0.upto(i - 1).each do |j|
      if a[j] > a[i]
        # 最後が木 j であるような減少部分列の末尾に木 i をくっつける
        dp[i] = [dp[i], dp[j] + 1].max
      end
    end
  end

  # 減少部分列が最大になる区間の長さを文字列に変換し末尾に改行を追加
  dp.max.to_s << "\n"
end

puts solve(STDIN.read)
