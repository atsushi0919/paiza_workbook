# 分割 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__strings_step3

INPUT1 = <<~"EOS"
  f,y
EOS
OUTPUT1 = <<~"EOS"
  f y
EOS

INPUT2 = <<~"EOS"
  j,t,xw
EOS
OUTPUT2 = <<~"EOS"
  j t xw
EOS

INPUT3 = <<~"EOS"
  a,zh,fd
EOS
OUTPUT3 = <<~"EOS"
  a zh fd
EOS

words = gets.split(",")

puts words.join(" ")
