# ラッキーナンバー (paizaランク B 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__b_lucky_number

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

# ruby 解答例3
BINGO = 7
# 入力
_, *a = INPUT0.split.map(&:to_i)
# BINGO 以下の数字だけ調べる
a.select! { |x| x <= BINGO }

# dpテーブル初期化
dp = Array.new(BINGO + 1) { [] }
# 数字の組み合わせで作れる数を記録していく
a.each do |num|
  p num
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

# 出力
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
