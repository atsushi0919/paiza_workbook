# 数列同士の引き算 (paizaランク D 相当)
# https://paiza.jp/works/mondai/loop_problems/loop_problems__seq_sub

n = gets.to_i
ary_a = gets.split(" ", n).map(&:to_i)
ary_b = gets.split(" ", n).map(&:to_i)

ary_a.zip(ary_b) { |a, b| puts a - b }
