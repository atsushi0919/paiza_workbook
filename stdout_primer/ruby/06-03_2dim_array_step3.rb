# 九九表の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__2dim_array_step3

# 解答例1
# i=1 から 9 までのループを設定
1.upto(9) do |i|
  # i の段の答えを配列 dan に格納
  dan = 1.upto(9).map { |j| i * j }
  # 出力
  puts(dan.join(" "))
end

# 解答例2
# 九九の表を作成
kuku = []
# 1 から9 までの二重ループを設定
1.upto(9) do |i|
  # i の段の答え 配列 dan を配列 kuku に追加
  dan = 1.upto(9).map { |j| i * j }
  kuku.push(dan)
end
# 出力
puts(kuku.map { |dan| dan.join(" ") })
