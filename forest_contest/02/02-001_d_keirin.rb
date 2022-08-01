# 競輪のユニフォーム (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_002/forest_contest_002__d_keirin

def solve(input_str)
  # 色の設定
  colors = %w(white black red blue yellow green orange pink purple)
  # 入力
  n = input_str.to_i

  # 番号に対応した色を返す
  colors[n - 1]
end

puts solve(STDIN.read)
