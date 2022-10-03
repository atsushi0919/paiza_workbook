# 採点 (paizaランク C 相当)

INPUT1 = <<~"EOS"
  4
  correct
  correct
  incorrect
  no_answer
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

n, *a = STDIN.read.split
score = 0
a.each do |e|
  if e == "correct"
    score += 2
  elsif e == "incorrect"
    score -= 1
  end
end

puts score
