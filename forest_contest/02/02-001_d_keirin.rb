# 競輪のユニフォーム (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_keirin

INPUT1 = <<~"EOS"
  2
EOS
OUTPUT1 = <<~"EOS"
  black
EOS

INPUT2 = <<~"EOS"
  5
EOS
OUTPUT2 = <<~"EOS"
  yellow
EOS

=begin
# 解答例1
# 入力
n = gets.to_i

# n に対応した色を出力
if n == 1
  puts "white"
elsif n == 2
  puts "black"
elsif n == 3
  puts "red"
elsif n == 4
  puts "blue"
elsif n == 5
  puts "yellow"
elsif n == 6
  puts "green"
elsif n == 7
  puts "orange"
elsif n == 8
  puts "pink"
elsif n == 9
  puts "purple"
end
=end

=begin
# 解答例1
# 入力
n = gets.to_i

# n に対応した色を出力
case n
when 1
  puts "white"
when 2
  puts "black"
when 3
  puts "red"
when 4
  puts "blue"
when 5
  puts "yellow"
when 6
  puts "green"
when 7
  puts "orange"
when 8
  puts "pink"
when 9
  puts "purple"
end
=end

# 解答例3
# 色の設定
colors = ["white", "black", "red", "blue", "yellow", "green", "orange", "pink", "purple"]
# なるべく少ない入力で配列を作る
# split メソッド
# colors = "white black red blue yellow green orange pink purple".split
# % 記法
# colors = %w(white black red blue yellow green orange pink purple)

# 入力
n = input_str.to_i

# n に対応した色を出力
puts colors[n - 1]

=begin
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
