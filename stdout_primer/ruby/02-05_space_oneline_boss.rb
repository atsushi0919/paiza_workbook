#　【半角スペース区切りの出力】1,000 個の数値を出力 (paizaランク D 相当)
#　https://paiza.jp/works/mondai/stdout_primer/stdout_primer__space_oneline_boss

# 入出力例1
# 1 から 1000 までの配列 ary を生成
# ary = [1, 2, 3, ... 998, 999, 1000]
ary = (1..1000).to_a
# 出力
puts(ary.join(" "))

# 入出力例2
# 1 から 1000 まで 1 ずつ増やしながら繰り返す
s = ""
1.upto(1000) do |num|
  s += num.to_s
  # 最後の数字にはスペースを追加しない
  break if n == max_n
  s += " "
end
# 出力
puts(s)
