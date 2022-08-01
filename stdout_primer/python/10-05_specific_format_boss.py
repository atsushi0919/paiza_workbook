# 【出力形式を指定して出力】ペアの数値の入った表を罫線入りで出力 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_format_boss

# 解答例
# 入力
h, w, a, b = map(int, input().split())
# 指定書式 (A, B) の文字列 s を生成
s = f"({a:9d}, {b:9d})"
# s を w 個 " | " で連結して末尾に改行を入れた文字列 line を生成
line = " | ".join(([s] * w)) + "\n"
# line を h 個 "=" * (25 * w - 3) で連結して
# 末尾に改行を追加した文字列 table を生成
# 22w + 3(w - 1) = 25w - 3
table = ("=" * (25 * w - 3) + "\n").join([line] * h)
# 出力
print(table)
