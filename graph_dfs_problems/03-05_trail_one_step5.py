# トレイルの通れない頂点 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step5

INPUT1 = """\
5 1 4
1
3
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
1 2 5 4
"""

INPUT2 = """\
4 1 4
1
2
1
2
3
1 3 4
2
2 4
2
2 3
"""
OUTPUT2 = """\
-1
"""

INPUT3 = """\
6 5 6
1
1
5
2 3 4 5 6
5
1 3 4 5 6
5
1 2 4 5 6
5
1 2 3 5 6
5
1 2 3 4 6
5
1 2 3 4 5
"""
OUTPUT3 = """\
5 4 6 2 4 3 5 2 3 6
"""


class Trail:
    def __init__(self, nodes, edges):
        self.nodes = nodes
        self.edges = edges


def main(input_str):
    input_lines = input_str.splitlines()
    # n: 頂点数, s: 起点, t: 終点
    n, s, t = map(int, input_lines[0].split())
    # 通らない頂点
    unused_vertices = list(map(int, input_lines[2].split()))
    # 隣接リスト
    ad_list = {}
    for (i, line) in enumerate(input_lines[3:], 1):
        if i % 2 != 0:
            continue
        ad_list[i // 2] = list(map(int, line.split()))

    # s から t への経路
    results = [[]]
    edges = [[False for w in range(n + 1)] for h in range(n + 1)]
    trails = [Trail([s], edges)]
    while len(trails) > 0:
        trail = trails.pop()
        # t に着いたら経路を記録
        if trail.nodes[-1] == t:
            if len(trail.nodes) > len(results[-1]):
                # resuts の頂点数より多いなら更新
                results = [trail.nodes]
            elif len(trail.nodes) == len(results[-1]):
                results.append(trail.nodes)

        # 隣接頂点に移動する
        cv = trail.nodes[-1]
        for nv in ad_list[cv]:
            # 使ったことのある経路ならスキップ
            if trail.edges[cv][nv]:
                continue
            if trail.edges[nv][cv]:
                continue
            # 通れない頂点はスキップ
            if cv in unused_vertices:
                continue

            # 新しい trail を trails に追加
            nodes = trail.nodes + [nv]
            edges = [e.copy() for e in trail.edges]
            edges[cv][nv] = True
            edges[nv][cv] = True
            trails.append(Trail(nodes, edges))

    # 頂点数が一番多い経路または -1 を出力
    if len(results[-1]) > 0:
        return " ".join(map(str, results[-1]))
    else:
        return -1


print(main(open(0).read()))
# print(main(INPUT3))