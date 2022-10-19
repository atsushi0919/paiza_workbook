# スポーツの人数 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__d_sports

INPUT1 = <<~"EOS"
  baseball
EOS

OUTPUT1 = <<~"EOS"
  9
EOS

# 解答例1
# 入力
s = gets.chomp

# 球技の人数を出力
if s == "baseball"
  puts 9
elsif s == "soccer"
  puts 11
elsif s == "rugby"
  puts 15
elsif s == "basketball"
  puts 5
elsif s == "volleyball"
  puts 6
end

# 解答例2
# 入力
s = gets.chomp

# 球技の人数を出力
case s
when "baseball"
  puts 9
when "soccer"
  puts 11
when "rugby"
  puts 15
when "basketball"
  puts 5
when "volleyball"
  puts 6
end

# 解答例3
# 球技の人数
sports = { "baseball" => 9,
           "soccer" => 11,
           "rugby" => 15,
           "basketball" => 5,
           "volleyball" => 6 }

# 入力
s = gets.chomp

# 球技の人数を出力
puts sports[s]
