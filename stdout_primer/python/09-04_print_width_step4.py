# 数値を M けた半角スペース埋めで出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__print_width_step4

# 解答例1
# 入力
n, m = map(int, input().split())
# 出力
print(f"{n:{m}d}")


# 解答例2
# 入力
n, m = map(int, input().split())
# 出力
print("{:{}d}".format(n, m))

# 解答例3
# 入力
n, m = map(int, input().split())
# 出力
print(str(n).rjust(m, " "))
