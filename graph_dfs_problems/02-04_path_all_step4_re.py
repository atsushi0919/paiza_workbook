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


def dfs(cv, nodes):
    for nv in ad_list[cv]:
        # 訪問済の頂点はスキップ
        if nv in nodes:
            continue
        # nv を通る
        nodes.append(nv)
        if nv == t:
            # t に着いたら経路を記録
            results.append(nodes.copy())
        else:
            # 次の層を探索
            dfs(nv, nodes)
        # nv を通らない
        nodes.pop()


input_str = open(0).read()
input_lines = input_str.splitlines()
# n: 頂点数, s: 起点, t: 終点
n, s, t = map(int, input_lines[0].split())
# 隣接リスト
ad_list = {}
for (i, line) in enumerate(input_lines[1:], 1):
    if i % 2 != 0:
        continue
    ad_list[i // 2] = list(map(int, line.split()))

# s から t までの経路
results = []
dfs(s, [s])

# 経路数と経路を全て出力
print(len(results))
[print(*e) for e in results]
