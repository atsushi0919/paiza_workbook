# カンマ区切りで 10 個出力 1 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_step3

# 解答例1
# 入力
ary = map(int, input().split())

# ary 先頭から順に参照する
s = ""
for n in ary:
    # 文字列 s に 文字列に変換した n を追加
    s += str(n)
    # 文字列 s に "," を追加
    s += ","
# 出力
print(s)

# 解答例2
# 入力
ary = map(int, input().split())
# 出力
print(",".join(map(str, ary)) + ",")
