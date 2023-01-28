# ラッキーナンバー (paizaランク B 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__b_lucky_number

# 入出力例
INPUT1 = """\
4
333
222
444
666"""
OUTPUT1 = """\
333 444"""

INPUT2 = """\
4
111
222
333
444"""
OUTPUT2 = """\
multiple answers"""

INPUT3 = """\
4
800
125
310
602"""
OUTPUT3 = """\
no answer"""

# python3 解答例1
BINGO = 777
# 入力
_, *a = [int(x) for x in open(0).read().split()]

# BINGO 以下の数字だけ調べる
a = [x for x in a if x <= BINGO]
n = len(a)
# 数字の組み合わせ数
max_cnt = (1 << n)

win_comb = []
# i を 1 から max_cnt - 1 までカウントアップ
for i in range(1, max_cnt):
    # n 桁の 2 進数に変換
    bits = bin(i)[2:].zfill(n)

    # 数字の組み合わせを作る
    tmp_comb = []
    for j in range(n):
        if bits[j] == "0":
            continue
        tmp_comb.append(a[j])

    # 数字の合計が BINGO のとき
    if sum(tmp_comb) == BINGO:
        # win_comb に数字の組み合わせを追加
        win_comb.append(tmp_comb)
    # BINGO が複数ならループを抜ける
    if len(win_comb) > 1:
        break

# 出力
if len(win_comb) == 0:
    # BINGO が作れない場合
    res = "no answer"
elif len(win_comb) == 1:
    # BINGO の組み合わせが 1 個
    res = " ".join(map(str, sorted(win_comb[0])))
else:
    # BINGO の組み合わせが 2 個以上
    res = "multiple answers"
print(res)
