# 【文字列の出力】入力された 10 個の文字列を出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__string_output_boss

# 解答例1
# 入力
ary = input().split()
# 出力
[print(s) for s in ary]

# 解答例2
# 入力
ary = input().split()
# 出力
for s in ary:
    print(s)

# 解答例3
# 入力
ary = input().split()
# 出力
for i in range(len(ary)):
    print(ary[i])
