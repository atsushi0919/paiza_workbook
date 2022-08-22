# グラフの s,t パス 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step4

INPUT1 = """\
5 1 4
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
OUTPUT1 = """\
7
1 2 3 4
1 2 3 5 4
1 2 5 3 4
1 2 5 4
1 5 2 3 4
1 5 3 4
1 5 4
"""
INPUT2 = """\
5 5 3
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
5 1 2 3
5 2 3
5 3
5 4 3
"""


def main(input_str):
    input_lines = input_str.splitlines()
    # n: 頂点数, s: 起点, t: 終点
    n, s, t = map(int, input_lines[0].split())
    # 隣接リスト
    ad_list = {}
    for (i, line) in enumerate(input_lines[1:], 1):
        if i % 2 != 0:
            continue
        ad_list[i // 2] = list(map(int, line.split()))

    # s から t への経路
    results = []
    paths = [[s]]
    while len(paths) > 0:
        path = paths.pop()
        # t に着いたら経路を記録
        if path[-1] == t:
            results.append(path)
            continue

        # 隣接頂点に移動する
        cv = path[-1]
        for nv in ad_list[cv]:
            # 訪問済の頂点はスキップ
            if nv in path:
                continue
            paths.append(path + [nv])

    # 経路数と経路を全て出力
    path_count = str(len(results))
    path_list = [" ".join(map(str, e)) for e in results]
    return "\n".join([path_count] + path_list)


print(main(open(0).read()))
