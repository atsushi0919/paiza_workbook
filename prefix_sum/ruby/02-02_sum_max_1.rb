# 連続する N 個の和の最大値 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__sum_max_step2

INPUT1 = <<"EOS"
1 2 3 4 5 6 7 8 9 10
EOS
OUTPUT1 = <<"EOS"
27
EOS

INPUT2 = <<"EOS"
8 1 3 1 3 8 3 1 8 8
EOS
OUTPUT2 = <<"EOS"
17
EOS

# 入力
k = 3
a = gets.split.map(&:to_i)

# 累積和
s = [0]
a.each { |num| s << s[-1] + num }

# 連続する3個の最大和を調べる
max_sum = 0
k.upto(a.length) do |i|
  # 今までの最大和より大きければ更新
  section_sum = s[i] - s[i - k]
  p section_sum
  max_sum = [max_sum, section_sum].max
end

# 連続する3個の最大和を出力
puts max_sum
