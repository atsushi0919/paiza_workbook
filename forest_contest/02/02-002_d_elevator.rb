# エレベーターの行き先 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_elevator

def solve(input_str)
  # 入力
  f1, f2 = input_str.split.map { |s| s[0].to_i }

  # 押すボタンを返す
  f1 < f2 ? "up" : "down"
end

puts solve(STDIN.read)
