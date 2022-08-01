# 【半角スペース区切りでの文字列の分割】5 つの文字列の半角スペース区切りでの分割 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_string_boss

# 解答例
s = "one two three four five"
# 文字列s をスペースで分割
words = s.split(" ")
# 配列 words の先頭から順に出力
for word in words:
    print(word)
