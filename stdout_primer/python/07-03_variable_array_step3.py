# 直角三角形の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_step3

# 入出力例
# INPUT1 = <<~"EOS"
#   4
# EOS
# OUTPUT1 = <<~"EOS"
#   1
#   1 2
#   1 2 3
#   1 2 3 4
# EOS

# INPUT2 = <<~"EOS"
#   1
# EOS
# OUTPUT2 = <<~"EOS"
#   1
# EOS

# 解答例1
# 入力
n = int(input())
# 出力
for i in range(1, n + 1):
  print(*range(1, i + 1))

# 解答例2
# 入力
n = int(input())
# 出力
[print(*range(1, i + 1)) for i in range(1, n + 1)]
