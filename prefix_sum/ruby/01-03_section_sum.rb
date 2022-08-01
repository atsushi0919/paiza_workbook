# 区間の和 3 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems/prefix_sum_problems__section_sum_step3

left, right = gets.split.map(&:to_i)
ary = gets.split.map(&:to_i)

prefix_sum = [0]
ary.each do |num|
  prefix_sum << prefix_sum[-1] + num
end

section_sum = prefix_sum[right + 1] - prefix_sum[left]
puts section_sum
