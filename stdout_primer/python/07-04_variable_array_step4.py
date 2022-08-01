# すべての行の長さが不定な 2 次元配列の出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_step4

# 入出力例
INPUT1 = <<~"EOS"
  4
  2 4 3 1
EOS
OUTPUT1 = <<~"EOS"
  1 2
  1 2 3 4
  1 2 3
  1
EOS

INPUT2 = <<~"EOS"
  1
  1
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

# 解答例1
# 入力
n = int(input())
ary = map(int, input().split())
# 出力
for m in ary:
    print(*range(1, m + 1))

# 解答例2
# 入力
n = int(input())
ary = map(int, input().split())
# 出力
[print(range(1, m + 1)) for m in ary]
