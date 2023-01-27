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

INPUT0 = <<"EOS"
4
3
2
4
6
EOS

# ruby 解答例2
BINGO = 777
# 入力
_, *a = $stdin.read.split.map(&:to_i)

# BINGO 以下の数字だけ調べる
a.select! { |x| x <= BINGO }
n = a.length

win_comb = []
# BINGO が複数あるかのフラグ
is_multiple = false
# 1 ~ n 個の組み合わせを全て調べる
1.upto(n) do |i|
  # i 個の組み合わせを作って tmp_comb で繰り返す
  a.combination(i) do |tmp_comb|
    if tmp_comb.sum == BINGO
      # BINGO なら win_comb に tmp_comb を追加
      win_comb << tmp_comb
      if win_comb.length > 1
        # BINGO が複数なら
        # is_multiple を true にしてループを抜ける
        is_multiple = true
        break
      end
    end
  end
  # is_multiple が true ならループを抜ける
  break if is_multiple
end

# 出力
puts case win_comb.length
  when 0
    # BINGO が作れない場合
    "no answer"
  when 1
    # BINGO の組み合わせが 1 個
    win_comb[0].sort.join(" ")
  else
    # BINGO の組み合わせが 2 個以上
    "multiple answers"
  end
