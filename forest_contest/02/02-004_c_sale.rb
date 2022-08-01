# セール販売 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__c_sale

INPUT1 = <<~"EOS"
  3
  shirt 1000
  shoes 2000
  shirt 500
EOS
OUTPUT1 = <<~"EOS"
  3500
EOS
INPUT2 = <<~"EOS"
  4
  shirt 500
  pants 1000
  pants 500
  shoes 2000
EOS
OUTPTU2 = <<~"EOS"
  3500
EOS

def solve(input_str)
  # 値引き条件対象
  target = "pants"
  # 入力
  _, *items = input_str.split("\n")

  # 合計金額計算
  pants = false
  total = 0
  items.each do |item|
    kind, price = item.split
    pants = true if kind == target
    total += price.to_i
  end
  # 値引き計算
  total -= 500 if pants && total >= 2000

  # 合計金額を返す
  total
end

puts solve(STDIN.read)
