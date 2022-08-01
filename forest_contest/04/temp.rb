# 入出力例
INPUT1 = <<~"EOS"
  27
  28
  29
  29
  28
  30
  25
  26
  28
EOS
OUTPUT1 = <<~"EOS"
  
EOS

INPUT2 = <<~"EOS"
  
EOS
OUTPUT2 = <<~"EOS"
  
EOS

INPUT3 = <<~"EOS"
  
EOS
OUTPUT3 = <<~"EOS"
  
EOS

def solve(input_str)
  a = input_str.split.map(&:to_i)

  res = false
  0.upto(8) do |i|
    min_t, max_t = a[i..i + 1].minmax
    if max_t - min_t >= 3
      res = true
      break
    end
  end
  puts res ? "Yes" : "No"
end

puts solve(STDIN.read)
