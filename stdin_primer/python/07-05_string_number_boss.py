# 【N個の文字列の入力】1 行目で与えられる N 個の文字列の入力 (large) (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__string_number_boss

# STEP3 と同じ
# 解答例
# 入力
_, *ary = input().split()
# 出力
[print(s) for s in ary]
