# 2 つの文字列の半角スペース区切りでの分割 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_string_step1

# 解答例1
s = "Hello paiza"
# 文字列s をスペースで分割
words = s.split(" ")
# 配列 words の先頭から順に出力
puts(words)

# 解答例2
s = "Hello paiza"
# 文字列s をスペースで分割
word0, word1 = s.split(" ")
# 出力
puts(word0)
puts(word1)
