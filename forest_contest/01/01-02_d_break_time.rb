# バイトの休憩時間 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__d_break_time

INPUT1 = <<~"EOS"
  9
EOS
OUTPUT1 = <<~"EOS"
  60 min
EOS
INPUT2 = <<~"EOS"
  6
EOS
OUTPUT2 = <<~"EOS"
  no break
EOS

# 解答例1
# 入力
h = gets.to_i

# 休憩時間を出力
if h > 8
  puts "60 min"
elsif h > 6
  puts "45 min"
else
  puts "no break"
end

# 解答例2
# 入力
h = gets.to_i

# 休憩時間
break_time = 0
if h > 8
  break_time += 60
elsif h > 6
  break_time += 45
end

# 休憩時間を出力
if break_time == 0
  puts "no break"
else
  puts "#{break_time} min"
end
