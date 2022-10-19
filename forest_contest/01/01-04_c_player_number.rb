# 背番号順 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__c_player_number

INPUT1 = <<~"EOS"
  3
  83 PAIZA
  11 SUZUKI
  90 TANAKA
EOS
OUTPUT1 = <<~"EOS"
  11 SUZUKI
  83 PAIZA
  90 TANAKA
EOS
INPUT2 = <<~"EOS"
  5
  31 SAITO
  56 GORO
  11 IIJIMA
  70 NAKAMURA
  1 HAJIME
EOS
OUTPUT2 = <<~"EOS"
  1 HAJIME
  11 IIJIMA
  31 SAITO
  56 GORO
  70 NAKAMURA
EOS

# 解答例1
# 入力
n = gets.to_i
players = []
n.times do
  number, name = gets.split
  players << [number.to_i, name]
end

# 選手リストを背番号で昇順ソート
players.sort!
# これでも同じ
# players.sort_by! { |x| x[0] }

# 出力
players.each do |number, name|
  puts "#{number} #{name}"
end

# 解答例2
# 入力
_, *players = STDIN.read.split("\n")

# ソートして出力
puts players.sort_by { |x| x.to_i }
