# テストケース1
INPUT1 = """\
0 7
5
1
2
3
4
5"""

# 自分で作ったテストケース
INPUT2 = """\
1 2
3
4
5
6"""


# デバッグ用
input_lines = INPUT2.split("\n")

# 提出用
# input_lines = open(0).readlines()

x, d = map(int, input_lines[0].split())
Q, *K = map(int, input_lines[1:])

sequence = [x]
for i in range(max(K)):
    a = sequence[i] + d
    sequence.append(a)

for k_i in K:
    index = k_i - 1
    print(sequence[index])