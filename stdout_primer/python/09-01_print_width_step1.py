# 数値を半角スペース埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_step1

# 解答例1
# 入力
n = int(input())
# 出力
print(f"{n:3d}")

# 解答例2
# 入力
n = int(input())
# 出力
print("{:{}d}".format(n, 3))

# 解答例3
# 入力
n = int(input())
# 出力
print(str(n).rjust(3, " "))

# 解答例4
# 入力
n = int(input())
# 3 桁になるようにスペースで埋める
s = " " * (3 - len(str(n))) + str(n)
# 出力
print(s)
