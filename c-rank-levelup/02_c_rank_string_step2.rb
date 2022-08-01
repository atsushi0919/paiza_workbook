# 部分文字列 (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_string_step2

INPUT1 = <<"EOS"
  Z
  Kirishima
EOS
OUTPUT1 = <<~"EOS"
  NO
EOS

INPUT2 = <<~"EOS"
  a
  paiza
EOS
OUTPUT2 = <<~"EOS"
  YES
EOS

# [解答例1]
a = gets.chomp
s = gets.chomp

result = "NO"
s.length.times do |idx|
  if s[idx] == a
    result = "YES"
    break
  end
end
puts result

=begin
# [解答例2]
a = gets.chomp
s = gets.chomp
if s.include?(a)
  puts "YES"
else
  puts "NO"
end
=end
