# エレベーターの行き先 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_elevator

INPUT1 = <<~"EOS"
  1F 7F
EOS
OUTPUT1 = <<~"EOS"
  up
EOS

INPUT2 = <<~"EOS"
  5F 2F
EOS
OUTPUT2 = <<~"EOS"
  down
EOS

=begin
# 解答例1
# 入力
f1, f2 = gets.split.map { |s| s[0].to_i }
# Ruby ならこう書いても同じ
f1, f2 = gets.split.map(&:to_i)

# f1 と f2 を比較して押すボタンを出力
if f1 < f2
  puts "up"
else
  puts "down"
end
=end

# 解答例2
# 入力
f1, f2 = gets.split

# f1 と f2 を比較して押すボタンを出力
puts f1 < f2 ? "up" : "down"
