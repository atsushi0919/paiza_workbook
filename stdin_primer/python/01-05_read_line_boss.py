# 【行入力】1,000 行の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__read_line_boss

# 解答例
n = 1000
# n = 1000 行分の入力を配列 ary に格納
ary = []
for _ in range(n):
    # 配列末尾に入力文字列を追加する
    ary.append(input())

# 配列の先頭から順番に出力
for s in ary:
    print(s)
