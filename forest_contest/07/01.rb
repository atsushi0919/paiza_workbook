# 占い (paizaランク D 相当)

INPUT1 = <<~"EOS"
  7
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  3
EOS
OUTPUT2 = <<~"EOS"
  No
EOS

puts gets.to_i == 7 ? "Yes" : "No"
