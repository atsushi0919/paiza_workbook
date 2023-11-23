# 区間の和 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step3

INPUT1 = <<"EOS"
2 7
1 2 3 4 5 6 7 8 9 10
EOS
OUTPUT1 = <<"EOS"
33
EOS

INPUT2 = <<"EOS"
3 5
3 5 7 1 5 9 8 5 2 4
EOS
OUTPUT2 = <<"EOS"
15
EOS

# 入力
x, y = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

# 累積和
s = [0]
a.each do |num|
  s << s[-1] + num
end

# 区間和を出力
section_sum = s[y + 1] - s[x]
puts section_sum
