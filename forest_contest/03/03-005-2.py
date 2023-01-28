# ラッキーナンバー (paizaランク B 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__b_lucky_number

# 入出力例
INPUT1 = """\
4
444
222
333
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

INPUT0 = """\
4
3
2
4
6"""

import itertools

# python3 解答例2
BINGO = 777
# 入力
_, *a = [int(x) for x in open(0).read().split()]

# BINGO 以下の数字だけ調べる
a = [x for x in a if x <= BINGO]
n = len(a)

win_comb = []
# BINGO が複数あるかのフラグ
is_multiple = False
# 1 ~ n 個の組み合わせを全て調べる
for i in range(1, n+1):
    for tmp_comb in itertools.combinations(a, i):
        if sum(tmp_comb) == BINGO:
            # BINGO なら win_comb に tmp_comb を追加
            win_comb.append(tmp_comb)
            if len(win_comb) > 1:
                # BINGO が複数なら
                # is_multiple を true にしてループを抜ける
                is_multiple = True
                break
    # is_multiple が true ならループを抜ける
    if is_multiple:
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
