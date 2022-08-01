# 入出力例
INPUT1 = <<~"EOS"
  4
  444
  222
  333
  666
EOS
OUTPUT1 = <<~"EOS"
  333 444
EOS

INPUT2 = <<~"EOS"
  4
  111
  222
  333
  444
EOS
OUTPUT2 = <<~"EOS"
  multiple answers
EOS

INPUT3 = <<~"EOS"
  4
  800
  125
  310
  602
EOS
OUTPUT3 = <<~"EOS"
  no answer
EOS

INPUT0 = <<~"EOS"
  4
  3
  2
  4
  6
EOS

def solve(input_str)
  bingo = 777
  n, *a = input_str.split.map(&:to_i)
  result = []
  1.upto(n) do |i|
    a.combination(i) { |c| result << c if c.sum == bingo }
  end

  case result.length
  when 0
    "no answer"
  when 1
    result[0].sort.join(" ")
  else
    "multiple answers"
  end
end

puts solve(STDIN.read)
