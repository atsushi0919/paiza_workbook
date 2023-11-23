# 【区間内の個数 (文字列) 】 区間内の個数 (文字列) 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__string_count_boss

INPUT1 = <<"EOS"
10 3 8
bwwbwbbwbw
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
10 3 8
wbbwbbbwwb
EOS
OUTPUT2 = <<"EOS"
4
EOS

def solve(input_str)
  input_lines = input_str.split("\n")
  _, x, y = input_lines[0].split.map(&:to_i)
  str = input_lines[1]

  # b: 1, w: 0
  b = str.chars.map { |c| c == "b" ? 1 : 0 }

  # 累積和
  s = [0]
  b.each { |num| s << s[-1] + num }

  # 区間の "b" の数
  s[y] - s[x - 1]
end

puts solve($stdin.read)

exit
# 入力
_, x, y = gets.split.map(&:to_i)
str = gets.chomp

# b: 1, w: 0
b = str.chars.map { |c| c == "b" ? 1 : 0 }

# 累積和
s = [0]
b.each { |num| s << s[-1] + num }

# 区間の "b" の数
num_of_b = s[y] - s[x - 1]
puts num_of_b
