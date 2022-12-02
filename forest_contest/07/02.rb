# 年収計算 (paizaランク D 相当)

INPUT1=<<~"EOS"
  200 50 10
EOS
OUTPUT1=<<~"EOS"
  300
EOS

INPUT2=<<~"EOS"
  200 50 9
EOS
OUTPUT2=<<~"EOS"
  250
EOS

a, b, c = gets.split.map(&:to_i)

case c
when 5..9
  a += b
when 10..14
  a += 2 * b
when 15..19
  a += 3 * b
when 20..24
  a += 4 * b
end

puts a
