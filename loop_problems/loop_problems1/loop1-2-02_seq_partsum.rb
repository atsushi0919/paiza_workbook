# 数列の A 番目から B 番目までの和 (paizaランク D 相当)
# https://paiza.jp/works/mondai/loop_problems/loop_problems__seq_partsum

# 5 1 3
# 1 2 3 4 5

n, a, b = gets.split.map(&:to_i)
ary = gets.split(" ", n).map(&:to_i)
puts ary[a - 1..b - 1].sum
