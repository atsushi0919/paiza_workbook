# バーティカルライン区切りで 3 つの文字列を出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_step2

# 解答例1
# 入力
ary = [input() for _ in range(3)]
# 出力
print("|".join(ary))

# 解答例2
# 入力
s1 = input()
s2 = input()
s3 = input()
# 出力
print(f"{s1}|{s2}|{s3}")

# 解答例3
# 入力
s1 = input()
s2 = input()
s3 = input()
# 出力
print(s1 + "|" + s2 + "|" + s3)
