# カンマ区切りで 10 個出力 2 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_step4

# 解答例1
# 入力
ary = [*map(int, input().split())]
# ary 末尾のインデックス
e_i = len(ary) - 1
# i=0 から e_i までカウントアップしながら繰り返す
s = ""
for i in range(e_i + 1):
    # ary[i] を文字列に変換して文字列 s に追加
    s += str(ary[i])
    # 最後の要素以外は文字列 s に "," を追加
    if i != e_i:
        s += ","
# 出力
print(s)

# 解答例2
# 入力
ary = map(int, input().split())
# 出力
print(",".join(map(str, ary)))

# 解答例3
# 入力
ary = [*map(int, input().split())]
# 出力
print(*ary, sep=",")
