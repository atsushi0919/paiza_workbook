# 複数の数値を半角スペース埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_step3

# 解答例1
# 1 行目入力
n = int(input())
# 続く n 行入力
ary = [int(input()) for _ in range(n)]
# 出力
[print(f"{m:3d}") for m in ary]

# 解答例2
# 1 行目入力
n = int(input())
# 続く n 行入力
ary = [int(input()) for _ in range(n)]
# 出力
[print("{:{}d}".format(m, 3)) for m in ary]

# 解答例3
# 1 行目入力
n = int(input())
# 続く n 行入力
ary = [int(input()) for _ in range(n)]
# 出力
[print(str(m).rjust(3, " ")) for m in ary]
