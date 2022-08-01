# 入出力例
INPUT1 = <<~"EOS"
  3
  a
  shift b
  c
EOS
OUTPUT1 = <<~"EOS"
  aBc
EOS

INPUT2 = <<~"EOS"
  7
  a
  capslock
  b
  c
  d
  capslock
  f
EOS
OUTPUT2 = <<~"EOS"
  aBCDf
EOS

def solve(input_str)
  n, *a = input_str.split("\n")

  capslock = false
  result = []
  a.map do |key|
    if key.length == 1
      # a-z
      result <<= capslock ? key.upcase : key
    elsif key.include?("shift")
      # shift + a-z
      result <<= key.split.last.upcase
    elsif key.include?("capslock")
      # capslock
      capslock = !capslock
    end
  end
  result.join
end

puts solve(STDIN.read)
