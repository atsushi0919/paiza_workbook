# 部分和問題 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_partial_sums_step2

INPUT1 = <<~"EOS"
  5 10
  7
  3
  4
  3
  2
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

def solve(input_lines)
  # 入力受け取り
  input_lines = input_lines.split("\n")
  n, x = input_lines.shift.split.map(&:to_i)
  *a = input_lines.map(&:to_i)

  # dpテーブル初期化
  dp = [0] + [1.0 / 0] * x
  # おもりを選ばなければ重さの和 0 を作ることができる

  # dpテーブル更新
  1.upto(n) do |i|
    x.downto(a[i - 1]) do |j|
      # dp[i-1] を使って j を作れるなら
      unless dp[j - a[i - 1]].infinite?
        # dp[i-1] を 使った場合:使わない場合 でおもりの数が少ない方を記録
        dp[j] = [dp[j], dp[j - a[i - 1]] + 1].min
      end
    end
  end

  # 和で重さ x を作れる最小の個数 , 作れない場合 -1 を返す
  dp[x].infinite? ? -1 : dp[x]
end

puts solve(SRDIN.read)

#        | j
#  i     | 0  1  2  3  4  5  6  7  8  9 10 |
#  - ( 0)| 0, ∞, ∞, ∞, ∞, ∞, ∞, ∞, ∞, ∞, ∞ |
# [1]( 7)| 0, ∞, ∞, ∞, ∞, ∞, ∞, 1, ∞, ∞, ∞ |
# [2]( 3)| 0, ∞, ∞, 1, ∞, ∞, ∞, 1, ∞, ∞, 2 |
# [3]( 4)| 0, ∞, ∞, 1, 1, ∞, ∞, 1, ∞, ∞, 2 |
# [4]( 3)| 0, ∞, ∞, 1, 1, ∞, 2, 1, ∞, ∞, 2 |
# [5]( 2)| 0, ∞, 1, 1, 1, 2, 2, 1, 3, 2, 2 |

=begin
1 ~ n の番号がついた n 個のおもりがあり、おもり i の重さは a_i です。
おもりを何個か選んで重さの和が x となるようにする方法を考えたとき、選ぶおもりの個数の最小値を出力してください。
なお、同じおもりを2個以上選ぶことはできません。
なお、重さの和が x となるようにおもりを選ぶ方法が存在しない場合は-1と出力してください。。
=end
