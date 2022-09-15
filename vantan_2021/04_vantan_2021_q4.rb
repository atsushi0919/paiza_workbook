# Q4: データの分類 (paizaランク A 相当)
# https://paiza.jp/works/mondai/vantan_2021/vantan_2021__q4_knn

INPUT1 = <<~"EOS"
  5
  2 0 5
  1 1 10
  2 -2 100
  -1 0 5
  0 1 10
  0 0
  3
  1
  5
  3
EOS
OUTPUT1 = <<~"EOS"
  5
  5
  10
EOS

# 入力
input_lines = INPUT1.split("\n")
# ラベルが分かっているデータの数
n = input_lines.shift.to_i
# ラベルが分かっているデータリスト [x, y, c]
a = input_lines.shift(n).map { |line| line.split.map(&:to_i) }
# 予測するポイントの座標
tx, ty = input_lines.shift.split.map(&:to_i)
# k 近傍法で種類を予測するときの k のリスト
_, *k = input_lines.map(&:to_i)

# k の重複を除去してソート
uniq_k = k.uniq.sort
# tx, ty から距離が近い順のラベルの配列を作る
labels = a.map { |x, y, c| [((x - tx) ** 2 + (y - ty) ** 2) ** 0.5, c] }.sort.map { |_, l| l }

# 調査する k
k_i = uniq_k.shift
# 多数決用のラベルの集計記録
lbl_agg = Hash.new(0)
# k_i の多数決の結果を記録
predicted_lbl = {}
# 現時点での多数決記録
major = { lbl: 0, cnt: 0 }
labels.each.with_index(1) do |lbl, i|
  lbl_agg[lbl] += 1
  # 1. 最も多いラベルを採用する
  # 2. 最も多いラベルが複数ならラベル番号が小さい方を採用する
  if lbl_agg[lbl] > major[:cnt] || lbl_agg[lbl] == major[:cnt] && lbl < major[:lbl]
    major[:lbl] = lbl
    major[:cnt] = lbl_agg[lbl]
  end
  # 調査対象の k_i
  if k_i == i
    # 多数決の結果を記録
    predicted_lbl[k_i] = major[:lbl]
    # 調査対象が無くなったら終了
    break if uniq_k.empty?
    k_i = uniq_k.shift
  end
end

# 元の k リストに対する予測結果を表示する
puts k.map { |k_i| predicted_lbl[k_i] }.join("\n")
