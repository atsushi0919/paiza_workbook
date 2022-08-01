# 10 個の数値を出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__space_oneline_step4

# 入出力例1
# 1 から 10 までの 配列ary を生成
# ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ary = list(range(1, 11))
# 出力
print(*ary)

# 入出力例2
# 1 から 10 までの 配列ary を生成
# ary = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
ary = list(range(1, 11))
# 出力
print(" ".join(map(str, ary)))

# 入出力例3
# 1 から 10 まで 1 ずつ増やしながら繰り返す
s = ""
for num in range(1, 11):
    s += str(num)
    # 最後の数字にはスペースを追加しない
    if num == 10:
        break
    s += " "
# 出力
print(s)
