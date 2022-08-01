#　10 個の数値を出力 (末尾に半角スペース有) (paizaランク D 相当)
#　https://paiza.jp/works/mondai/stdout_primer/stdout_primer__space_oneline_step3

# 解答例1
# 1 から 10 までの配列 ary を作成
# ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ary = (1..10).to_a
# 出力 (末尾に半角スペース有)
puts(aty.join(" ") + " ") # 解答例1
# 1 から 10 までの配列 ary を作成
# ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ary = (1..10).to_a
# 出力 (末尾に半角スペース有)
puts(aty.join(" ") + " ")

# 解答例2
# 1 から 10 までの配列 ary を作成
ary = (1..10).to_a
# 配列 ary の先頭から順に文字列に変換して半角スペースを追加して
# 文字列 s に追加する (末尾に半角スペース有)
s = ""
ary.each do |num|
  s += num.to_s + " "
end
# 出力
puts(s)
