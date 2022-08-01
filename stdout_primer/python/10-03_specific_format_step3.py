# 九九表を罫線入りで出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_format_step3

# 解答例1
# 1 から 9 の段の答えを指定書式で配列 dan に格納
line = []
for tate in range(1, 10):
    dan = []
    # tate 段目の答えを 半角スペース埋め2桁の文字列にして配列 dan に追加
    for yoko in range(1, 10):
        dan.append(f"{tate * yoko:2d}")
    # 配列 dan を " | " で連結して末尾に改行を追加
    line.append(" | ".join(dan) + "\n")
# 配列 dan を "=" * 42 + "\n" で連結
kuku = ("=" * 42 + "\n").join(line)
# 出力
print(kuku)

# 解答例2
# tate 段目の答えを指定書式に変換して配列 line に格納
line = [" | ".join([f"{tate * yoko:2d}" for yoko in range(1, 10)]) + "\n"
        for tate in range(1, 10)]
# 配列 line を "=" * 42 + "\n" で連結
kuku = ("=" * 42 + "\n").join(line)
# 出力
print(kuku)
