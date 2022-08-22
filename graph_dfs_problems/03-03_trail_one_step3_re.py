# グラフの最長 s,t トレイル (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step3

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
1 5 3 2 5 4
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
5 4 3 2 1 5 3
"""

INPUT3 = """\
6 5 6
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
5 4 6 3 5 1 2 4 3 1 6 2 5 6
"""


def dfs(cv, nodes, edges):
    for nv in ad_list[cv]:
        # 通過済み経路はスキップ
        if edges[cv][nv]:
            continue
        if edges[nv][cv]:
            continue

        # nv を通る
        nodes.append(nv)
        edges[cv][nv] = True
        edges[nv][cv] = True
        if nv == t:
            # t に着いたら経路を記録
            results.append(nodes.copy())
        # 再帰呼び出し
        dfs(nv, nodes, edges)
        # nv を通らない
        nodes.pop()
        edges[cv][nv] = False
        edges[nv][cv] = False


input_str = INPUT2
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
edges = [[False for w in range(n + 1)] for h in range(n + 1)]
dfs(s, [s], edges)

# s から t に行ける経路を頂点数で昇順ソート
results.sort(key=lambda x: len(x))
# 頂点数が最も多い経路から 1 つ出力
print(" ".join(map(str, results[-1])))


'''
class Trail:
    def __init__(self, nodes, edges):
        self.nodes = nodes
        self.edges = edges


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
    edges = [[False for w in range(n + 1)] for h in range(n + 1)]
    trails = [Trail([s], edges)]
    while len(trails) > 0:
        trail = trails.pop()
        # t に着いたら経路を記録
        if trail.nodes[-1] == t:
            results.append(trail.nodes)

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

    # s から t に行ける経路を頂点数で昇順ソート
    results.sort(key=lambda x: len(x))
    # 頂点数が最も多い経路から 1 つ出力
    return " ".join(map(str, results[-1]))


print(main(open(0).read()))
'''
