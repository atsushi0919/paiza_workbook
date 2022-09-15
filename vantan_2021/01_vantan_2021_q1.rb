# Q1: お釣り (paizaランク D 相当)
# https://paiza.jp/works/mondai/vantan_2021/vantan_2021__q1_change

INPUT1 = <<~"EOS"
  110
  200
EOS
OUTPUT1 = <<~"EOS"
  90
EOS

INPUT2 = <<~"EOS"
  12345
  9876
EOS
OUTPUT2 = <<~"EOS"
  Tarimasen!
EOS

s, m = STDIN.read.split.map(&:to_i)

puts s <= m ? m - s : "Tarimasen!"
