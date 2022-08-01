# 数字の受け取り 2 (paizaランク D 相当)
# https://paiza.jp/works/mondai/loop_problems/loop_problems__input_num_step2

n = gets.to_i
ary = gets.split(" ", n).map(&:to_i)
ary.each { |num| puts num }
