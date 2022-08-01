#　10 行の出力 (paizaランク D 相当)
#　https://paiza.jp/works/mondai/stdout_primer/stdout_primer__newline_digit_step4

# 解答例1
ary = [813, 1, 2, 923874, 23648, 782356, 3256, 2342, 24324, 112]
# 出力
[print(num) for num in ary]

# 解答例2
ary = [813, 1, 2, 923874, 23648, 782356, 3256, 2342, 24324, 112]
# 出力
for num in ary:
    print(num)

# 解答例3
ary = [813, 1, 2, 923874, 23648, 782356, 3256, 2342, 24324, 112]
# 出力
for i in range(len(ary)):
    print(ary[i])
