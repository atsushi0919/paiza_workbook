# ペアの数値の入った表を罫線入りで出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_format_step4

# 解答例
# 入力
h, w, a, b = map(int, input().split())
# 指定書式 (A, B) の文字列 s を生成
s = f"({a}, {b})"
# s を w 個 " | " で連結して末尾に改行を入れた文字列 line を生成
line = " | ".join([s] * w) + "\n"
# line を h 個 "=" * (9 * w - 3) で連結して
# 末尾に改行を追加した文字列 table を生成
# 6w + 3(w - 1) = 9w - 3
table = ("=" * (9 * w - 3) + "\n").join([line] * h)
# 出力
print(table)
