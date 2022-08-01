# 【行によって長さが違う二次元配列の表示】すべての行の長さと値が不定な 2 次元配列の出力 (paizaランク B 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_boss

# 入出力例
# INPUT1 = <<~"EOS"
#   10 4
#   1 2 3 4 5 6 7 8 9 10
#   2 6 1 1
# EOS
# OUTPUT1 = <<~"EOS"
#   1 2
#   3 4 5 6 7 8
#   9
#   10
# EOS

# INPUT2 = <<~"EOS"
#   1 1
#   1
#   1
# EOS
# OUTPUT2 = <<~"EOS"
#   1
# EOS

# 解答例
# 入力
n, m = map(int, input().split())
ary_a = list(map(int, input().split()))
ary_b = list(map(int, input().split()))
# ary_b の要素で繰り返し処理
for b in ary_b:
    # ary_a の先頭から b 個分の要素を半角スペース区切りで出力
    print(*ary_a[:b])
    # 出力済みの要素を削除
    ary_a = ary_a[b:]
