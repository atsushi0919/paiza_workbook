# 連続する N 個の和の最大値 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_step1

# 入力
k = 3
a = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]

# 累積和
s = [0]
a.each { |num| s << s[-1] + num }

# 連続する3個の最大和を調べる
max_sum = 0
k.upto(a.length) do |i|
  # 今までの最大和より大きければ更新
  section_sum = s[i] - s[i - k]
  max_sum = [max_sum, section_sum].max
end

# 連続する3個の最大和を出力
puts max_sum
