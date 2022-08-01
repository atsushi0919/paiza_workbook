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
  1
  2
  3
  4
EOS

def solve(input_str)
  bingo = 777
  n, *a = input_str.split.map(&:to_i)
  # 1 ≤ x_i ≤ 1000
  a.select! { |x| x <= bingo }

  # dpテーブル初期化
  dp = Array.new(bingo + 1) { [] }
  dp[0] <<= [0]
  # num を使って作れる数を記録
  a.each do |num|
    bingo.downto(num) do |i|
      next if dp[i - num].empty?
      dp[i - num].each do |a|
        dp[i] << a + [num]
      end
    end
    # bingo の組み合わせが2個以上見つかったらループを抜ける
    break if dp[bingo].length > 1
  end

  # 組み合わせの数で出力を分岐
  case dp[bingo].length
  when 0
    "no answer"
  when 1
    dp[bingo][0].sort[1..].join(" ")
  else
    "multiple answers"
  end
end

puts solve(STDIN.read)
