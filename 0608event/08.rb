bingo = $stdin.read.split.map(&:chars)

bingo_line = 0

# 横ビンゴ
bingo_line += bingo.count { |line| line.all?("#") }

# 縦ビンゴ
bingo_line += bingo.transpose.count { |line| line.all?("#") }

# 斜めビンゴ
bingo_line += 1 if [bingo[0][0], bingo[1][1], bingo[2][2]].all?("#")
bingo_line += 1 if [bingo[0][2], bingo[1][1], bingo[2][0]].all?("#")

puts bingo_line

# bingo_line += [bingo[0][0], bingo]

# puts bingo_line

# bingo_line = 0

# # 横ビンゴ
# bingo_line += 1 if bingo[0][0] == bingo[0][1] && bingo[0][1] == bingo[0][2] && bingo[0][2] == "#"
# bingo_line += 1 if bingo[1][0] == bingo[1][1] && bingo[1][1] == bingo[1][2] && bingo[1][2] == "#"
# bingo_line += 1 if bingo[2][0] == bingo[2][1] && bingo[2][1] == bingo[2][2] && bingo[2][2] == "#"

# # 縦ビンゴ
# bingo_line += 1 if bingo[0][0] == bingo[1][0] && bingo[1][0] == bingo[2][0] && bingo[2][0] == "#"
# bingo_line += 1 if bingo[0][1] == bingo[1][1] && bingo[1][1] == bingo[2][1] && bingo[2][1] == "#"
# bingo_line += 1 if bingo[0][2] == bingo[1][2] && bingo[1][2] == bingo[2][2] && bingo[2][2] == "#"

# # 斜めビンゴ
# bingo_line += 1 if bingo[0][0] == bingo[1][1] && bingo[1][1] == bingo[2][2] && bingo[2][2] == "#"
# bingo_line += 1 if bingo[0][2] == bingo[1][1] && bingo[1][1] == bingo[2][0] && bingo[2][0] == "#"

# puts bingo_line
