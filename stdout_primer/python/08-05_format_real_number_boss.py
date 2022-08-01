# 【実数をフォーマット指定して出力】複数の実数を出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__format_real_number_boss

# 入出力例
# INPUT1 = <<~"EOS"
#   4
#   0.813 1
#   0.813 2
#   0.813 3
#   0.813 4
# EOS
# OUTPUT1 = <<~"EOS"
#   0.8
#   0.81
#   0.813
#   0.8130
# EOS

INPUT2 = """67
5.793100 1
19.802616 2
17.541800 2
7.667322 3
8.86714 2
21.116853 2
1.764300 4
75.906473 2
41.105118 1
95.687882 1
4.818 3
8.881090 4
86.791425 1
82.38097 3
61.446999 1
43.549811 3
9.298704 3
57.691801 3
76.279237 1
79.631593 2
2.960199 2
43.912814 2
52.109975 1
8.748450 4
46.778304 4
44.966277 2
53.196681 2
7.631648 2
6.679869 2
8.617972 2
58.509839 4
69.774453 4
1.177692 3
66.140109 2
5.365974 1
4.503102 3
3.489801 3
2.102660 2
6.392 1
3.352832 4
67.212945 1
4.779389 1
7.70246 1
4.987491 2
2.322784 1
3.816234 4
94.298994 3
3.516501 2
32.720140 1
6.202218 2
16.93897 3
54.756119 3
9.278432 1
3.671914 2
2.479192 3
86.240821 3
95.528558 2
13.921016 1
1.950944 1
52.904500 1
8.209946 3
86.436802 2
1.815094 1
44.821106 4
4.926568 2
22.603423 3
5.906044 4"""

# 解答例1
# 入力
input_lines = INPUT2.split("\n")
q = int(input_lines[0])
# q = int(input())
print(input_lines[1:])
ary = []
for line in input_lines[1:]:
    n, m = line.split()
    ary.append([float(n), int(m)])
# for _ in range(q):
#     n, m = input().split()
#     ary.append([float(n), int(m)])
# 出力
[print(f"{round(n, m):.{m}f}") for n, m in ary]

# # 解答例2
# # 入力
# q = int(input())
# ary = []
# for _ in range(q):
#     n, m = input().split()
#     ary.append([float(n), int(m)])
# # 出力
# [print("{:.{}f}".format(round(n, m), m)) for n, m in ary]

# # 解答例3
# # 入力
# q = int(input())
# ary = []
# for _ in range(q):
#     n, m = input().split()
#     ary.append([float(n), int(m)])
# # ary の先頭から順に繰り返す
# for n, m in ary:
#     # 小数第 m 位に丸める
#     n = int(n * 10 ** m + 0.5) / 10 ** m
#     # 整数部と小数部の文字列にして分ける
#     int_part, dec_part = str(n).split(".")
#     # 小数部の 0 が足りないなら追加する
#     dec_part += "0" * (m - len(dec_part))
#     # 出力
#     print(f"{int_part}.{dec_part}")
