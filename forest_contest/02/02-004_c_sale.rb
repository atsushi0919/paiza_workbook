# セール販売 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__c_sale

INPUT1 = <<"EOS"
3
shirt 1000
shoes 2000
shirt 500
EOS
OUTPUT1 = <<"EOS"
3500
EOS
INPUT2 = <<"EOS"
4
shirt 500
pants 1000
pants 500
shoes 2000
EOS
OUTPTU2 = <<"EOS"
3500
EOS

# 解答例1
# 入力
n = gets.to_i                    # 1 行の入力を受け取って整数型に変換
lines = []                       # 購入履歴を格納するための空のリストを用意
n.times { lines << gets.chomp }  # n 行の入力を受け取って lines に追加

# 上記を短く書くと(n は不要になる)
# _, *lines = $stdin.read.split("\n")

# 購入品 item と合計金額 total を記録する
items = []
total = 0
lines.each do |line|
  item, price = line.split
  items << item
  total += price.to_i
end

# もし "pants" を購入かつ total が 2000 円以上なら 500 円引き
if items.include?("pants") && total >= 2000
  total -= 500
end

puts total

=begin
# 解答例2
# 入力
_, *lines = $stdin.read.split("\n")

# "pants" を買ったか?のフラグ と合計金額 total を記録する
pants = false
total = 0
lines.each do |line|
  item, price = line.split
  pants = true if item == "pants"
  total += price.to_i
end

# もし pants を購入かつ total が 2000 円以上なら 500 円引き
if pants && total >= 2000
  total -= 500
end

puts total
=end
