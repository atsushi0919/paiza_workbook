# 最小の運賃 (paizaランク A 相当)
# https://paiza.jp/works/mondai/real_event/min_fare

import heapq


def solve(input_str):
    # ----------------------------------------
    # 入力受け取り
    # ----------------------------------------
    # 入力文字列を改行で分割
    input_lines = input_str.strip().split("\n")
    # e: 路線数, v: 駅数, t: 目的地
    e, v, t = map(int, input_lines[0].split())
    # routes: 路線の情報
    routes = [list(map(int, route.split())) for route in input_lines[1:]]

    # ----------------------------------------
    # route_map: 隣接リスト作成
    # ----------------------------------------
    route_map = [[] for _ in range(v)]
    # st_a: 駅a, st_b: 駅b, fare: 運賃
    for st_a, st_b, fare in routes:
        # 駅a と 駅b は同じ運賃で行き来できる
        route_map[st_a].append([st_b, fare])
        route_map[st_b].append([st_a, fare])

    # ----------------------------------------
    # 駅0 から 駅t までの最小運賃を求める
    # ----------------------------------------
    # スタート地点の情報[0: 運賃, 0: 駅番号]で search_list を初期化
    search_list = [[0, 0]]
    # 各駅までの最小運賃を None で初期化
    min_fares = [None] * v
    # search_list が空になるまで繰り返す
    while search_list:
        # 合計運賃が最小の駅を取り出し現在駅とする
        # current_fare: 現在駅に着くための合計運賃
        # current_st: 現在駅番号
        current_fare, current_st = heapq.heappop(search_list)
        # 現在駅の最小運賃が確定済みならスキップ
        if min_fares[current_st] is not None:
            continue
        # 現在駅を最小運賃で確定させる
        min_fares[current_st] = current_fare

        # 現在駅がゴールなら駅tまでの最小運賃を返す
        # (文字列に変換して末尾に改行を追加)
        if current_st == t:
            return str(min_fares[t]) + "\n"

        # 現在駅からの路線情報を順に調べる
        for next_st, next_fare in route_map[current_st]:
            # 次の駅の最小運賃が確定済みならスキップ
            if min_fares[next_st] is not None:
                continue
            # search_list に次の駅までの運賃と駅番号を追加
            heapq.heappush(search_list, [current_fare + next_fare, next_st])


INPUT1 = """5 5 3
0 1 200
0 4 500
0 2 200
1 4 200
4 3 300
"""

OUTPUT1 = """700
"""

INPUT2 = """3 6 3
0 1 200
1 3 150
2 4 100
"""

OUTPUT2 = """350
"""

INPUT3 = """9 6 4
0 1 120
0 2 190
0 5 300
1 2 100
1 3 250
2 3 110
2 5 120
4 3 120
4 5 190
"""

OUTPUT3 = """430
"""

print(solve(open(0).read()))
