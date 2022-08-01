# スポーツの人数 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__d_sports

def solve(input_str)
  # 球技の人数
  count_table = { "baseball" => 9,
                  "soccer" => 11,
                  "rugby" => 15,
                  "basketball" => 5,
                  "volleyball" => 6 }
  # 球技名入力
  s = input_str.chomp

  # 入力された球技の人数を返す
  count_table[s]
end

puts solve(STDIN.read)
