g1, p1 = gets.split.map(&:to_i)
x1 = p1 / g1.to_f
g2, p2 = gets.split.map(&:to_i)
x2 = p2 / g2.to_f

puts x1 < x2 ? 1 : 2
