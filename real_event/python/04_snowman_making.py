# 雪だるま作り (paizaランク A 相当)
# https://paiza.jp/works/mondai/real_event/snowman_making

from collections import deque


# リストを両端キューのように使う
# 今回の問題でも一応通るけど要素数が増えると処理が遅くなる
def solve1(input_str):
    # 入力受け取り
    n, k, *snow_balls = map(int, input_str.split())

    # snow_balls 昇順ソート
    snow_balls.sort()

    count = 0
    # 雪玉が2個以上ある間ループ
    while len(snow_balls) > 1:
        # 最大径の雪玉を取り出し body とする
        body = snow_balls.pop()

        # 最小径から順に取り出すループ
        while snow_balls:
            # 最小径の雪玉を取り出し head とする
            head = snow_balls.pop(0)
            # 高さが k 以上か？
            if head + body >= k:
                # count を +1
                count += 1
                # 最小径の雪玉を取り出すループを抜ける
                break

    return count


# 両端キューモジュール collections.deque を使う
# 要素数が増えても早い
def solve2(input_str):
    # 入力受け取り
    n, k, *snow_balls = map(int, input_str.split())

    # snow_balls 昇順ソート, deque オブジェクト生成
    snow_balls = deque(sorted(snow_balls))

    count = 0
    # 雪玉が2個以上ある間ループ
    while len(snow_balls) > 1:
        # 最大径の雪玉を取り出し body とする
        body = snow_balls.pop()

        # 最小径から順に取り出すループ
        while snow_balls:
            # 最小径の雪玉を取り出し head とする
            head = snow_balls.popleft()
            # 高さが k 以上か？
            if head + body >= k:
                # count を +1
                count += 1
                # 最小径の雪玉を取り出すループを抜ける
                break

    return count


print(solve2(open(0).read()))
