# ロボットの移動 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_robot_movement

# 解答例1-1
sx = 0  # スタート座標 x
sy = 0  # スタート座標 y
x, y = map(int, input().split())

# マンハッタン距離
print(abs(x - sx) + abs(y - sy))

# 解答例1-2
x, y = map(int, input().split())

# (0, 0) からのマンハッタン距離
print(abs(x) + abs(y))

# 解答例1-3
print(sum(map(lambda x: abs(int(x)), input().split())))