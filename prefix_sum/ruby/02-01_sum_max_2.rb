# 連続する N 個の和の最大値 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_step1

# 入力
k = 3
a = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]

# 累積和と最大区間和の更新
max_sum = 0
s = [0]
a.each_with_index do |num, i|
  # 累積和更新
  s << s[-1] + num
  # 3個目の要素からは区間和を調べる
  if i >= k - 1
    # 区間和が最大なら更新
    max_sum = [max_sum, s[-1] - s[i - (k - 1)]].max
  end
end

# 連続する3個の和の最大値を出力
puts max_sum
