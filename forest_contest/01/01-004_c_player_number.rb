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

def solve(input_str)
  # 入力
  _, *players = input_str.split("\n")

  # 選手リスト作成
  players.map! do |player|
    number, name = player.split
    [number.to_i, name]
  end

  # 背番号順の選手リストを返す
  players.sort.map { |player| player.join(" ") }
end

puts solve(STDIN.read)
