# グラフのパス (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step3

INPUT1 = """\
3 1 2
"""
OUTPUT1 = """\
1 2 3
"""

INPUT2 = """\
5 5 3
"""
OUTPUT2 = """\
5 4 3 2
"""


def main(input_str):
    # n: 頂点数, s: 起点, k: 回数
    n, s, k = map(int, input_str.split())
    # 隣接リスト
    ad_list = {}
    for i in range(1, n + 1):
        e = [j for j in range(1, n + 1) if j != i]
        ad_list[i] = e

    # s から k 回移動する経路
    path = [s]
    for _ in range(k):
        # 今いる頂点
        cv = path[-1]
        # 移動可能な頂点を選択して walk 末尾へ追加
        for nv in ad_list[cv][::-1]:
            # 訪問済の頂点はスキップ
            if nv in path:
                continue
            # path に追加してループを抜ける
            path.append(nv)
            break

    # 経路を出力
    return " ".join(map(str, path))


print(main(open(0).read()))
