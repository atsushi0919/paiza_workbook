# 入出力例
INPUT1 = <<~"EOS"
  4
  333
  222
  444
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

def solve(input_str)
  bingo = 777
  n, *a = input_str.split.map(&:to_i)
  max_cnt = (1 << n) - 1

  result = "no answer"
  1.upto(max_cnt) do |i|
    bit = i.to_s(2).rjust(n, "0")
    tmp = []
    0.upto(n - 1) do |j|
      next if bit[j] == "0"
      tmp << a[j]
    end
    if tmp.sum == bingo
      if result == "no answer"
        result = tmp.sort.join(" ")
      else
        return "multiple answers"
      end
    end
  end
  result
end

puts solve(STDIN.read)
