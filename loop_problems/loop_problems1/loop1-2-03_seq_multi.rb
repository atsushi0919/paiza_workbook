# 数列の値を全部 * 2 して出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/loop_problems/loop_problems__seq_multi

n = gets.to_i
ary = gets.split(" ", n).map(&:to_i)
ary.each { |num| puts num * 2 }
