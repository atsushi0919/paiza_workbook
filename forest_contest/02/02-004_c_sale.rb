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

=begin
# 解答例1
# 入力
n = gets.to_i
shopping_list = []
n.times do
  item, price = gets.split
  shopping_list << [item, price.to_i]
end

# pants 購入チェックと合計金額計算
bought_pants = false
total = 0
items.each do |item, price|
  bought_pants = true if item == "pants"
  total += price
end

# 値引き処理
if bought_pants && total >= 2000
  total -= 500
end

# 支払金額を出力
puts total
=end

# 解答例2

def solve(input_str)
  # 入力
  input_lines = input_str.split("\n")
  shopping_list = input_lines[1..].map do |line|
    item, price = line.split
    [item, price.to_i]
  end

  # pants 購入チェックと合計金額計算
  bought_pants = false
  total = 0
  shopping_list.each do |item, price|
    bought_pants = true if item == "pants"
    total += price
  end

  # 値引き処理
  if bought_pants && total >= 2000
    total -= 500
  end

  # 合計金額を返す
  total
end

puts solve(INPUT1)
# > ["3", "shirt 1000", "shoes 2000", "shirt 500"]
# > [["shirt", 1000], ["shoes", 2000], ["shirt", 500]]
# > [false, 3500]
# > 3500
puts solve(INPUT2)
# > ["4", "shirt 500", "pants 1000", "pants 500", "shoes 2000"]
# > [["shirt", 1000], ["shoes", 2000], ["shirt", 500]]
# > [true, 4000]
# 3500
