#　【改行あり出力】1,000 行の出力 (paizaランク D 相当)
#　https://paiza.jp/works/mondai/stdout_primer/stdout_primer__newline_digit_boss

# 解答例1
# 1 から 1000 までの配列 ary を作成
# ary = [1, 2, 3, ... 998, 999, 1000]
ary = (1..1000).to_a
# 出力
puts(ary)

# 解答例2
# 出力
1.upto(1000) do |num|
  puts(num)
end
