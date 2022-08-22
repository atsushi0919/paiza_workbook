# トレイルの経由地 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step4

INPUT1 = """\
5 1 4 5
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
1 5 2 3 5 4
"""

INPUT2 = """\
4 3 4 1
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
6 5 6 3
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
5 6 4 5 3 4 2 5 1 3 6
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
        # t に着いたら経路を記録
        if nv == t:
            q_count = nodes.count(q)
            if q_count > results["q_count"]:
                # 現在の q_count より多いなら更新
                results["q_count"] = q_count
                results["trails"] = [nodes.copy()]
            elif q_count == results["q_count"] and q_count > 0:
                # 現在の q_count と同じなら経路を追加
                results["trails"].append(nodes.copy())
        # 再帰呼び出し
        dfs(nv, nodes, edges)
        # nv を通らない
        nodes.pop()
        edges[cv][nv] = False
        edges[nv][cv] = False


input_str = INPUT3
input_lines = input_str.splitlines()
# n: 頂点数, s: 起点, t: 終点, q: 中継点
n, s, t, q = map(int, input_lines[0].split())
# 隣接リスト
ad_list = {}
for (i, line) in enumerate(input_lines[1:], 1):
    if i % 2 != 0:
        continue
    ad_list[i // 2] = list(map(int, line.split()))

# s から t への経路
results = {"q_count": 0, "trails": []}
edges = [[False for w in range(n + 1)] for h in range(n + 1)]
dfs(s, [s], edges)

# q を一番多く通過した経路のうち一つ または -1 を出力
if results["q_count"] > 0:
    print(" ".join(map(str, results["trails"][0])))
else:
    print(-1)
