# 【n * n の 2 次元配列の表示】N * N の九九表の出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__2dim_array_boss

# 入出力例
INPUT1 = <<~"EOS"
  3
EOS
OUTPUT1 = <<~"EOS"
  1 2 3
  2 4 6
  3 6 9
EOS

# 解答例1
# 入力
n = gets.to_i
# 1 から n までの二重ループを設定
1.upto(n) do |i|
  # i の段の答えを配列 dan に格納
  dan = 1.upto(n).map { |j| i * j }
  # 出力
  puts(dan.join(" "))
end

# 解答例2
# 入力
n = gets.to_i
# n * n の表を作成
kuku = []
# 1 から n までの二重ループを設定
1.upto(n) do |i|
  # i の段の答え 配列 dan を配列 kuku に追加
  dan = 1.upto(n).map { |j| i * j }
  kuku.push(dan)
end
# 出力
puts(kuku.map { |dan| dan.join(" ") })
