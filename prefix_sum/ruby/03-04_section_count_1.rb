# 【区間内の個数】区間内の個数 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_count_boss

INPUT1 = <<"EOS"
10 2 7
1 2 3 4 5 6 7 8 9 10
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
8 1 3
1 3 8 3 1 8 8 1
EOS
OUTPUT2 = <<"EOS"
1
EOS

def solve(input_str)
  # 入力
  input_lines = input_str.split("\n")
  _, x, y = input_lines[0].split.map(&:to_i)
  a = input_lines[1].split.map(&:to_i)

  # 偶数: 1, 奇数: 0
  b = a.map { |num| num.even? ? 1 : 0 }

  # 累積和
  s = [0]
  b.each { |num| s << s[-1] + num }

  # a[x] ~ a[y] 区間の偶数の数を返す
  s[y + 1] - s[x]
end

puts solve($stdin.read)

=begin
# 入力
_, x, y = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 偶数: 1, 奇数: 0
b = a.map { |num| num.even? ? 1 : 0 }

# 累積和
s = [0]
b.each { |num| s << s[-1] + num }

# 区間の偶数の数
even_count = s[y + 1] - s[x]
puts even_count
=end
