# 区間内の個数 (文字列) 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_step1

# 入力
l = 3
r = 8
str = "bwbwwbwbwb"

# b: 1, w: 0
b = []
str.split("").each do |c|
  if c == "b"
    b << 1
  else
    b << 0
  end
end

# 累積和
s = [0]
b.each { |num| s << s[-1] + num }

# 区間の "b" の数
num_of_b = s[r] - s[l - 1]
puts num_of_b
