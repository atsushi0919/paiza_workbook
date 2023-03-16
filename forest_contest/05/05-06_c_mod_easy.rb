# 条件を満たす最小の整数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_mod_easy

INPUT1 = <<"EOS"
11 7 2
EOS

OUTPUT1 = <<"EOS"
16
EOS

# 解答例1-1
x, y, z = gets.split.map(&:to_i)

while x % y != z
  x += 1
end

puts x

# 解答例1-2
x, y, z = gets.split.map(&:to_i)

(y - 1).times do
  break if x % y == z
  x += 1
end

puts x

# 解答例2
x, y, z = gets.split.map(&:to_i)

puts x + (z - x % y) % y
