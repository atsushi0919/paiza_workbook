# ラッキーナンバー (paizaランク B 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__b_lucky_number

# 入出力例
INPUT1 = <<"EOS"
4
333
222
444
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

# ruby 解答例1
BINGO = 777
# 入力
_, *a = $stdin.read.split.map(&:to_i)

# BINGO 以下の数字だけ調べる
a.select! { |x| x <= BINGO }
n = a.length
# 数字の組み合わせ数 - 1
max_cnt = (1 << n) - 1

win_comb = []
# i を 1 から max_cnt までカウントアップ
1.upto(max_cnt) do |i|
  # n 桁の 2 進数に変換
  bits = i.to_s(2).rjust(n, "0")

  # 数字の組み合わせを作る
  tmp_comb = []
  0.upto(n - 1) do |j|
    tmp_comb << a[j] if bits[j] == "1"
  end

  # 数字の合計が BINGO のとき
  if tmp_comb.sum == BINGO
    # win_comb に数字の組み合わせを追加
    win_comb << tmp_comb
    # BINGO が複数ならループを抜ける
    break if win_comb.length > 1
  end
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
