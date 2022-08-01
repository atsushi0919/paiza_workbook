# 整数の組からの選択 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__pair_data_step3

# 入出力例
INPUT1 = <<~"EOS"
  10
  813 813
  8 13
  81 1
  81 3
  8 813
  8 138
  813 8
  83 18
  8 13
  88 88
EOS
OUTPUT1 = <<~"EOS"
  83 18
EOS

# 解答例1
t = 8
# 1 行目入力
n = gets.to_i
# 続く n 行入力
pairs = n.times.map { gets.split.map(&:to_i) }
# t 個目の要素を参照
pair = pairs[t - 1]
# 出力
puts(pair.join(" "))

# 解答例1
t = 8
# 1 行目入力
n = gets.to_i
# 続く n 行入力
pairs = []
n.times do
  # 半角スペースで分割して整数型に変換する
  pair = gets.split.map(&:to_i)
  # pairs に pair を追加する
  pairs.push(pair)
end
# t 個目の要素を参照
pair = pairs[t - 1]
# 出力
puts(pair.join(" "))
