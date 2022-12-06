# 競輪のユニフォーム (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_keirin

INPUT1 = <<"EOS"
2
EOS
OUTPUT1 = <<"EOS"
black
EOS

INPUT2 = <<"EOS"
5
EOS
OUTPUT2 = <<"EOS"
yellow
EOS

=begin
# 解答例1
# 入力
n = gets.to_i

# n に対応した色を出力
color = if n == 1
  "white"
elsif n == 2
  "black"
elsif n == 3
  "red"
elsif n == 4
  "blue"
elsif n == 5
  "yellow"
elsif n == 6
  "green"
elsif n == 7
  "orange"
elsif n == 8
  "pink"
elsif n == 9
  "purple"
end

puts color
=end

=begin
# 解答例2
# 入力
n = gets.to_i

# n に対応した色を出力
color = case n
  when 1
    "white"
  when 2
    "black"
  when 3
    "red"
  when 4
    "blue"
  when 5
    "yellow"
  when 6
    "green"
  when 7
    "orange"
  when 8
    "pink"
  when 9
    "purple"
  end

puts color
=end

=begin
# 解答例3
# 色の設定
colors = ["white", "black", "red", "blue", "yellow", "green", "orange", "pink", "purple"]

# なるべく少ない入力で配列を作るなら
# split メソッド
# colors = "white black red blue yellow green orange pink purple".split
# % 記法
# colors = %w(white black red blue yellow green orange pink purple)

# 入力
n = gets.to_i

# n に対応した色を出力
puts colors[n - 1]

n が
1のとき、white
2のとき、black
3のとき、red
4のとき、blue
5のとき、yellow
6のとき、green
7のとき、orange
8のとき、pink
9のとき、purple
=end
