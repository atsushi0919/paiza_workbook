# 【部分和】部分和問題 4 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_partial_sums_boss

INPUT1 = <<~"EOS"
  5 10
  9
  3
  4
  11
  8
EOS
OUTPUT1 = <<~"EOS"
  yes
EOS

def solve(input_lines)
  # 入力受け取り
  input_lines = input_lines.split("\n")
  n, x = input_lines.shift.split.map(&:to_i)
  *a = input_lines.map(&:to_i)

  # dpテーブル初期化
  # おもりを選ばなければ重さの和 0 作ることができる
  dp = [true] + [false] * x

  # dpテーブル更新
  0.upto(n - 1) do |i|
    a[i].upto(x) do |j|
      # a[i-1] を使って おもさ j を作れる組み合わせを足す
      dp[j] += dp[j - a[i]]
    end
    # break if dp[x] > 0
  end

  # x が作れるかを出力
  dp[x] > 0 ? "yes" : "no"
end

puts solve(STDIN.read)

#        | j
#  i     | 0  1  2  3  4  5  6  7  8  9 10 |
#  - ( 0)| 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 |
# [1]( 9)| 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0 |
# [2]( 3)| 1, 0, 0, 1, 0, 0, 1, 0, 0, 2, 0 |
# [3]( 4)| 1, 0, 0, 1, 1, 0, 1, 1, 1, 2, 1 |
# [4](11)| 1, 0, 0, 1, 1, 0, 1, 1, 1, 2, 1 |
# [5]( 8)| 1, 0, 0, 1, 1, 0, 1, 1, 2, 2, 1 |

=begin
1 ~ n の番号がついた n 種類のおもりがあり、おもり i の重さは a_i です。
それぞれのおもりは無限個存在しており、任意のおもりを任意の個数使うことができます。
このとき、おもりを選んで重さの和を x となるようにすることができるかどうか判定してください。
=end
