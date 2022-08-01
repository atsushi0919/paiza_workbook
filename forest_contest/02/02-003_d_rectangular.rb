# 長方形の面積 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_rectangular

def solve(input_str)
  # 入力
  e1, e2 = input_str.split.map(&:to_i)

  # 面積計算
  s = e1 * e2

  # 面積 s または invalid を返す
  s > 0 ? s : "invalid"
end

puts solve(STDIN.read)
