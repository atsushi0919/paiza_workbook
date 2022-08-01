# 十億連勝 (paizaランク S 相当)
# https://paiza.jp/works/mondai/real_event/continuous_winsning

INPUT1 = """3 4
3
2
3
"""

OUTPUT1 = """7
"""

INPUT2 = """5 1
1
1
1
1
1
"""

OUTPUT2 = """12
"""

INPUT3 = """14 6
8
5
9
7
6
9
0
9
8
2
8
1
4
10
"""

OUTPUT3 = """247159393
"""

INPUT4 = """4 6
8
1
4
2
"""


def solve(input_str):
    # 下9桁表示用
    d = 1_000_000_000
    # -----------------------------------
    # 入力受け取り
    # -----------------------------------
    # n: ステージ数, x: ボーナス条件, game_sets: 試合のセット数
    n, x, *game_sets = map(int, input_str.strip().split())

    # -----------------------------------
    # state_table: 連勝状態の表を作成・更新する
    # -----------------------------------
    # state_table 初期化
    # キー: (連勝数, ボーナスフラグ), 値: この状態になっている数
    state_table = {(0, False): 1}

    # ステージ分 繰り返す
    for games in game_sets:
        # 試合がない場合スキップ
        if games == 0:
            continue

        # 新しい状態を設定
        states = {}
        # 前回のゲーム終了時の連勝状態を先頭から順に参照する
        # wins: 連勝数, flag: ボーナスフラグ, count: カウント
        for (wins, flag), count in state_table.items():
            # 連勝数x未満で負けのパターン
            key = (0, flag)
            states[key] = states.get(key, 0) + \
                count * min(games, x - wins)

            if games > x - wins:
                # ボーナスを満たして負けるパターン
                key = (0, True)
                states[key] = states.get(key, 0) + count
            else:
                # 連勝で終わるパターン
                key = (wins + games, flag)
                states[key] = states.get(key, 0) + count
        # state_table を上書きする
        state_table = states

    # -----------------------------------
    # bonus: 隠しステージが出現する状態を集計する
    # -----------------------------------
    bonus = 0
    # ボーナス発生パターンを集計
    for (wins, flag), count in state_table.items():
        if flag or wins == x:
            bonus += count
    # ボーナス発生パターンの下9桁を返す
    return str(bonus % d) + "\n"


print(solve(open(0).read()))
