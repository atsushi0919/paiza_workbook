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


def dfs(cv, nodes, edges):
    for nv in ad_list[cv]:
        # 通過済み経路はスキップ
        if edges[cv][nv]:
            continue
        if edges[nv][cv]:
            continue
        # 通れない頂点はスキップ
        if cv in unused_vertices:
            continue

        # nv を通る
        nodes.append(nv)
        edges[cv][nv] = True
        edges[nv][cv] = True

        if nv == t:
            # t に着いたら経路を記録
            global results
            if len(nodes) > len(results[-1]):
                # resuts の頂点数より多いなら更新
                results = [nodes.copy()]
            elif len(nodes) == len(results[-1]):
                results.append(nodes.copy())
        else:
            # 再帰呼び出し
            dfs(nv, nodes, edges)
        # nv を通らない
        nodes.pop()
        edges[cv][nv] = False
        edges[nv][cv] = False


input_str = open(0).read()
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
dfs(s, [s], edges)

# s から t に行ける経路を頂点数で昇順ソート
results.sort(key=lambda x: len(x))
# 頂点数が一番多い経路または -1 を出力
if len(results[-1]) > 0:
    print(" ".join(map(str, results[-1])))
else:
    print(-1)
