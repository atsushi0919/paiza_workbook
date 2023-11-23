# 【連続する N 個の和の最大値】 連続する N 個の和の最大値 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_boss

INPUT1 = <<"EOS"
10 3
1 2 3 4 5 6 7 8 9 10
EOS
OUTPUT1 = <<"EOS"
27
EOS

INPUT2 = <<"EOS"
8 3
13 81 31 83 38 11 33 88
EOS
OUTPUT2 = <<"EOS"
195
EOS

def solve(input_str)
  # 入力
  _, k, *a = input_str.split.map(&:to_i)

  # 累積和と最大区間和の更新
  max_sum = 0
  s = [0]
  a.each_with_index do |num, i|
    # 累積和更新
    s << s[-1] + num
    # k個目の要素からは区間和を調べる
    if i >= k - 1
      # 区間和が最大なら更新
      max_sum = [max_sum, s[-1] - s[i - (k - 1)]].max
    end
  end

  # 連続するk個の最大和を返す
  max_sum
end

puts solve($stdin.read)
