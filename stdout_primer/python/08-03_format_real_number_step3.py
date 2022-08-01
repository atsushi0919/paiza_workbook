# 1 つの実数を出力 3 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__format_real_number_step3

# 入出力例
# INPUT1 = <<~"EOS"
#   0.813
# EOS
# OUTPUT1 = <<~"EOS"
#   0.813
# EOS

# INPUT2 = <<~"EOS"
#   8.13
# EOS
# OUTPUT2 = <<~"EOS"
#   8.130
# EOS

# INPUT3 = <<~"EOS"
#   3.141692
# EOS
# OUTPUT3 = <<~"EOS"
#   3.142
# EOS

# 解答例1
d = 3
# 入力
n = float(input())
# 小数第 d 位に丸める
n = round(n, d)
# 出力
print(f"{n:.{d}f}")

# 解答例2
d = 3
# 入力
n = float(input())
# 小数第 d 位に丸める
n = round(n, d)
# 出力
print("{:.{}f}".format(n, d))

# # 解答例3
# d = 3
# # 入力
# n = float(input())
# # 小数第 d 位に丸める
# n = int(n * 10 ** d + 0.5) / 10 ** d
# # 整数部と小数部の文字列にして分ける
# int_part, dec_part = str(n).split(".")
# # 小数部の 0 が足りないなら追加する
# dec_part += "0" * (d - len(dec_part))
# # 出力
# print(f"{int_part}.{dec_part}")
