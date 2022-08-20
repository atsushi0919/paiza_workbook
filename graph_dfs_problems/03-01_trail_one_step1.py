# グラフのトレイル (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step1

INPUT1 = """\
3 1 2
"""
OUTPUT1 = """\
1 2 3
"""

INPUT2 = """\
5 1 5
"""
OUTPUT2 = """\
1 5 3 4 5 2
"""

INPUT3 = """\
14 3 9
"""


class Trail:
    def __init__(self, nodes, edges):
        self.nodes = nodes
        self.edges = edges


def main(input_str):
    input_lines = input_str.splitlines()
    # n: 頂点数, s: 起点, k: 回数
    n, s, k = map(int, input_lines[0].split())
    # 隣接リスト
    ad_list = {}
    for i in range(1, n + 1):
        ad_list[i] = [j for j in range(1, n + 1) if j != i]

    # 起点 s から k 回移動する経路
    edges = [[False for w in range(n + 1)] for h in range(n + 1)]
    trails = [Trail([s], edges)]
    while len(trails) > 0:
        trail = trails.pop()
        # k 回移動したら経路を記録
        if len(trail.nodes) == k + 1:
            return " ".join(map(str, trail.nodes))

        # 隣接頂点に移動する
        cv = trail.nodes[-1]
        for nv in ad_list[cv]:
            # 使ったことのある経路ならスキップ
            if trail.edges[cv][nv]:
                continue
            if trail.edges[nv][cv]:
                continue

            # 新しい trail を trails に追加
            nodes = trail.nodes + [nv]
            edges = [e.copy() for e in trail.edges]
            edges[cv][nv] = True
            edges[nv][cv] = True
            trails.append(Trail(nodes, edges))


# print(main(open(0).read()))
print(main(INPUT3))
