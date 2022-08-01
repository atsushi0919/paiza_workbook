# 半角スペースとバーティカルライン区切りで 10 個出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_step5

# 入出力例
INPUT1 = <<~"EOS"
  0
  1
  2
  3
  4
  5
  6
  7
  8
  9
EOS
OUTPUT1 = <<~"EOS"
  0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
EOS

INPUT2 = <<~"EOS"
  804
  42
  547
  203
  795
  607
  922
  378
  268
  979
EOS
OUTPUT2 = <<~"EOS"
  804 | 42 | 547 | 203 | 795 | 607 | 922 | 378 | 268 | 979
EOS

# 解答例1
# 入力
ary = 10.times.map { gets.to_i }
# ary 末尾のインデックス
e_i = ary.length - 1
# i=0 から e_i までカウントアップしながら繰り返す
s = ""
0.upto(e_i) do |i|
  # ary[i] を文字列に変換して文字列 s に追加
  s += ary[i].to_s
  # 最後の要素以外は文字列 s に "," を追加
  s += " | " if i != e_i
end
# 出力
puts(s)

# 解答例2
# 入力
ary = 10.times.map { gets.to_i }
# 出力
puts(ary.join(" | "))
