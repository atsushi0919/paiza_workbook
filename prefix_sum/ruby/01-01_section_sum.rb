# 区間の和 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step1

ary = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]
left = 2
right = 7

prefix_sum = [0]
ary.each do |num|
  prefix_sum.push(prefix_sum.last + num)
end

section_sum = prefix_sum[right + 1] - prefix_sum[left]
puts section_sum
