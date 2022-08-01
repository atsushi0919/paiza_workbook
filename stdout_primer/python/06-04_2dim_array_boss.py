# 【n * n の 2 次元配列の表示】N * N の九九表の出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__2dim_array_boss

# 解答例1
# 入力
n = int(input())
# 1 から n までの二重ループを設定
for i in range(1, n + 1):
    # i の段の答えを配列 dan に格納
    dan = [i * j for j in range(1, n + 1)]
    # 出力
    print(*dan)

# 解答例2
# 入力
n = int(input())
# n * n の表を作成
kuku = []
# 1 から n までの二重ループを設定
for i in range(1, n + 1):
    # i の段の答え 配列 dan を配列 kuku に追加
    dan = [i * j for j in range(1, n + 1)]
    kuku.append(dan)
# 出力
[print(" ".join(dan)) for dan in kuku]
