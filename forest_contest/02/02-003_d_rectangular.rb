# 長方形の面積 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_rectangular

INPUT1 = <<"EOS"
7 5
EOS
OUTPUT1 = <<"EOS"
35
EOS

INPUT2 = <<"EOS"
0 10
EOS
OUTPUT2 = <<"EOS"
invalid
EOS

=begin
# 解答例1
# 入力
# input_strings = gets.split  # 半角スペースで分割して文字列の配列を生成
# e1 = input_strings[0].to_i  # 1 番目の文字列を整数に変換
# e2 = input_strings[1].to_i  # 2 番目の文字列を整数に変換

# ↓ 短く書くと

e1, e2 = gets.split.map(&:to_i)

# 面積計算
s = e1 * e2

# 面積 s または invalid を出力
if s > 0
  puts s
else
  puts "invalid"
end
=end

# 解答例2
# 入力から面積を計算
# 半角スペースで区切られた文字列を整数の配列にして、
# 配列の要素を全て掛け合わせた値（総積）を s に格納する
s = gets.split.map(&:to_i).inject(:*)

# 面積 s または invalid を出力
puts s > 0 ? s : "invalid"
