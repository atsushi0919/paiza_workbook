# 【出力幅を指定して出力】N 個の数値を M けた半角スペース埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_boss

# 解答例1
# 1 行目入力
n, m = map(int, input().split())
# 続く n 行入力
ary = [int(input()) for _ in range(n)]
# 出力
[print(f"{a:{m}d}") for a in ary]

# 解答例2
# 1 行目入力
n, m = map(int, input().split())
# 続く n 行入力
ary = [int(input()) for _ in range(n)]
# 出力
[print("{:{}d}".format(a, m)) for a in ary]

# 解答例3
# 1 行目入力
n, m = map(int, input().split())
# 続く n 行入力
ary = [int(input()) for _ in range(n)]
# 出力
[print(str(a).rjust(m, " ")) for a in ary]
