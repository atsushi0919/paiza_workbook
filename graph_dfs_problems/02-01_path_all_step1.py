# 隣接頂点の出力 2 (paizaランク D 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step1

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
1 3
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
1 2 3 4
"""


def main(input_str):
    input_lines = input_str.splitlines()
    # n: 頂点数, s: 探索対象の頂点
    n, s = map(int, input_lines[0].split())
    # 隣接リスト
    ad_list = {}
    for (i, line) in enumerate(input_lines[1:], 1):
        if i % 2 != 0:
            continue
        ad_list[i // 2] = list(map(int, line.split()))

    # 頂点 s の隣接頂点を番号順に半角スペース区切りで出力
    return " ".join(map(str, ad_list[s]))


print(main(open(0).read()))
