# 隣接頂点の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step1

INPUT1 = """\
3 2
1
2
2
1 3
1
2
"""
OUTPUT1 = """\
3
"""

INPUT2 = """\
5 5
2
2 5
3
1 3 5
3
2 4 5
2
3 5
4
1 2 3 4
"""
OUTPUT2 = """\
4
"""


def main(input_str):
    input_lines = input_str.splitlines()
    # n: 頂点数, s: 指定の頂点
    n, s = map(int, input_lines[0].split())
    # 頂点番号 i = 1 から n までの隣接リスト作成
    ad_list = {}
    for (i, line) in enumerate(input_lines[1:], 1):
        # 経路数 v は使わない
        if i % 2 == 0:
            # 隣接リストに経路を格納
            ad_list[i // 2] = list(map(int, line.split()))

    # 頂点 s に隣接している頂点の最大番号
    return ad_list[s][-1]


print(main(open(0).read()))
