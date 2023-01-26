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
1
2
3
4"""

# python 解答例2
BINGO = 777
_, *a = [int(x) for x in INPUT1.split()]

# BINGO 以下の数字だけ調べる
a = [x for x in a if x <= BINGO]
n = len(a)

# dpテーブル初期化
dp = [[] for _ in range(BINGO+1)]

# 数字を使って作れる数を記録
for num in a:
    for i in range(BINGO, num-1, -1):
        if len(dp[i - num]) == 0:
            continue
        for ary in dp[i - num]:
            dp[i].append(ary + [num])

    # BINGO が複数ならループを抜ける
    if len(dp[BINGO]) > 1:
        break
    # 単体で作れる数
    dp[num].append([num])


if len(dp[BINGO]) == 0:
    # BINGO が作れない場合
    res = "no answer"
elif len(dp[BINGO]) == 1:
    # BINGO の組み合わせが 1 個
    res = " ".join(map(str, sorted(dp[BINGO][0])))
else:
    # BINGO の組み合わせが 2 個以上
    res = "multiple answers"

print(res)