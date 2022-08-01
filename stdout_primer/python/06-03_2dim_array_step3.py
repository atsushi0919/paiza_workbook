# 九九表の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__2dim_array_step3

# 解答例1
# 1 から 9 までの二重ループを設定
for i in range(1, 10):
    # i の段の答えを配列 dan に格納
    dan = [i * j for j in range(1, 10)]
    # 出力
    print(*dan)

# 解答例2
# 九九の表を作成
kuku = []
# 1 から 9 までの二重ループを設定
for i in range(1, 10):
    # i の段の答え 配列 dan を配列 kuku に追加
    dan = [i * j for j in range(1, 10)]
    kuku.append(dan)
# 出力
[print(*dan) for dan in kuku]
