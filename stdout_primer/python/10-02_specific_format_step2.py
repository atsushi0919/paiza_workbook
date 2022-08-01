# 文字列と N 個の整数の出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_format_step2

# 解答例1
# 入力
n, a, b = map(int, input().split())
# "(a, b)" 形式の文字列を生成
s = f"({a}, {b})"
# 要素 s が n 個の配列を生成
ary = [s] * n
# 出力
print(", ".join(ary))

# 解答例2
# 入力
n, a, b = map(int, input().split())
# 出力
print(", ".join([f"({a}, {b})"] * n))
