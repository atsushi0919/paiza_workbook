# 数列の和 (paizaランク D 相当)
# https://paiza.jp/works/mondai/loop_problems/loop_problems__seq_sum

n = gets.to_i
ary = gets.split(" ", n).map(&:to_i)
puts ary.sum
