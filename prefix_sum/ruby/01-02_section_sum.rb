# 区間の和 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step2

left = 2
right = 7
ary = gets.split.map(&:to_i)

prefix_sum = [0]
ary.each do |num|
  ary << prefix_sum[-1] + num
end

section_sum = prefix_sum[right + 1] - prefix_sum[left]
puts section_sum
