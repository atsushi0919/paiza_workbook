# 採点 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_scoring

INPUT1 = """\
4
correct
correct
incorrect
no_answer"""
OUTPUT1 = "3"

# 解答例1
n = int(input())
a = [input() for _ in range(n)]

score = 0
for res in a:
    if res == "correct":
        score += 2
    elif res == "incorrect":
        score -= 1

print(score)

# 解答例2
SCORE_LIST = {
    "correct": 2,
    "no_answer": 0,
    "incorrect": -1,
}
_, *a = open(0).read().strip().split()

print(sum(map(lambda k: SCORE_LIST[k], a)))
