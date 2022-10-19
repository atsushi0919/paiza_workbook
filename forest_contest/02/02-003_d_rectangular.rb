# 長方形の面積 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_rectangular

INPUT1 = <<~"EOS"
  7 5
EOS
OUTPUT1 = <<~"EOS"
  35
EOS

INPUT2 = <<~"EOS"
  0 10
EOS
OUTPUT2 = <<~"EOS"
  invalid
EOS

=begin
# 解答例1
# 入力
e1, e2 = gets.split.map(&:to_i)

# 面積計算
s = e1 * e2

# 面積 s または invalid を出力
if s > 0
  puts s
else
  puts "invalid"
end
=end

# 解答例2
# 入力から面積を計算
s = gets.split.map(&:to_i).inject(:*)

# 面積 s または invalid を出力
puts s > 0 ? s : "invalid"
