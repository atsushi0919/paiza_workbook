# 改行区切りでの N 個の文字列の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__string_number_step1

# 解答例
# 1 行目入力
n = int(input())
# 続く n 行入力
ary = [input() for _ in range(n)]
# 出力
[print(s) for s in ary]
