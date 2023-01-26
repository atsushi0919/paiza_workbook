# 入出力例
INPUT1 = <<"EOS"
4
444
222
333
666
EOS
OUTPUT1 = <<"EOS"
333 444
EOS

INPUT2 = <<"EOS"
4
111
222
333
444
EOS
OUTPUT2 = <<"EOS"
multiple answers
EOS

INPUT3 = <<"EOS"
4
800
125
310
602
EOS
OUTPUT3 = <<"EOS"
no answer
EOS

INPUT0 = <<~"EOS"
  4
  1
  2
  3
  4
EOS

BINGO = 777
_, *a = INPUT3.split.map(&:to_i)
# BINGO 以下の数字だけ調べる
a.select! { |x| x <= BINGO }

# dpテーブル初期化
dp = Array.new(BINGO + 1) { [] }

# 数字を使って作れる数を記録
a.each do |num|
  BINGO.downto(num) do |i|
    next if dp[i - num].empty?
    dp[i - num].each do |ary|
      dp[i] << ary + [num]
    end
  end
  # BINGO が複数ならループを抜ける
  break if dp[BINGO].length > 1
  # 単体で作れる数
  dp[num] << [num]
end

puts case dp[BINGO].length
  when 0
    # BINGO が作れない場合
    "no answer"
  when 1
    # BINGO の組み合わせが 1 個
    dp[BINGO][0].sort.join(" ")
  else
    # BINGO の組み合わせが 2 個以上
    "multiple answers"
  end
