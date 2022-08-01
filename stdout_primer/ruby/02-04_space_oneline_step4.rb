#　10 個の数値を出力 (paizaランク D 相当)
#　https://paiza.jp/works/mondai/stdout_primer/stdout_primer__space_oneline_step4

# 解答例1
# 1 から 10 までの 配列ary を生成
# ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ary = (1..10).to_a
# 出力
puts(ary.join(" "))

# 解答例2
n = 10
# 1 から 10 まで 1 ずつ増やしながら繰り返す
s = ""
1.upto(n) do |num|
  s += n.to_s
  # 最後の数字にはスペースを追加しない
  break if num == n
  s += " "
end
# 出力
puts(s)
