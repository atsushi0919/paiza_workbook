# グラフの s,t パス (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step4

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
5 3
"""


def main(input_str):
    input_lines = input_str.splitlines()
    # n: 頂点数, s: 起点, t: 終点
    n, s, t = map(int, input_lines[0].split())
    # 隣接リスト
    ad_list = {}
    for (i, line) in enumerate(input_lines[1:], 1):
        # 経路数 v は使わない
        if i % 2 == 0:
            # 隣接リストに経路を格納
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

        # 未訪問の隣接頂点に移動する
        cv = path[-1]
        for nv in ad_list[cv]:
            # 訪問済の頂点はスキップ
            if nv in path:
                continue
            # 新しい経路を追加
            paths.append(path + [nv])

    # s から t に行ける経路を頂点数で昇順ソート
    results.sort(key=lambda x: len(x))
    # 最も頂点数が少ない経路を出力
    return " ".join(map(str, results[0]))


print(main(open(0).read()))
