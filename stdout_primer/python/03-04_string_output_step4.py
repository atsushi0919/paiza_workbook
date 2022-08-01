# 入力された 10 個の文字列を出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__string_output_step4

# 解答例1
# 10 行の入力を配列 ary に格納
ary = [input() for _ in range(10)]
# 出力
print(*ary)

# 解答例2
# 10 行の入力を配列 ary に格納
ary = []
for _ in range(10):
    ary.append(input())
# 出力
print(*ary)

# 解答例3
n = 10
# 10 行の入力
s = ""
for i in range(n):
    s += input()
    # 最後の入力に半角スペースは追加しない
    if i == n - 1:
        break
    s += " "
# 出力
print(s)
