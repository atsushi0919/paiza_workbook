# 文字のカウント (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__strings_step1

INPUT1 = <<~"EOS"
  hmhktqr
EOS
OUTPUT1 = <<~"EOS"
  0
  0
  0
  0
  0
  0
  0
  2
  0
  0
  1
  0
  1
  0
  0
  0
  1
  1
  0
  1
  0
  0
  0
  0
  0
  0
EOS

INPUT2 = <<~"EOS"
  cjfc
EOS
OUTPUT2 = <<~"EOS"
  0
  0
  2
  0
  0
  1
  0
  0
  0
  1
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
EOS
INPUT3 = <<~"EOS"
  fr
EOS
OUTPUT3 = <<~"EOS"
  0
  0
  0
  0
  0
  1
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  0
  1
  0
  0
  0
  0
  0
  0
  0
  0
EOS

s = gets.chomp

results = Hash.new(0)
s.chars.each do |c|
  results[c] += 1
end

puts ("a".."z").map { |k| results[k] }
