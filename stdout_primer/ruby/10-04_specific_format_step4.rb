# ペアの数値の入った表を罫線入りで出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_format_step4

# 入出力例
INPUT1 = <<~"EOS"
  2 3 7 8
EOS
OUTPUT1 = <<~"EOS"
  (7,_8)_|_(7,_8)_|_(7,_8)
  ========================
  (7,_8)_|_(7,_8)_|_(7,_8)
EOS

INPUT2 = <<~"EOS"
  3 2 0 0
EOS
OUTPUT2 = <<~"EOS"
  (0,_0)_|_(0,_0)
  ===============
  (0,_0)_|_(0,_0)
  ===============
  (0,_0)_|_(0,_0)
EOS

# 解答例
# 入力
h, w, a, b = gets.split.map(&:to_i)
# 指定書式 (A, B) の文字列 s を生成
s = "(#{a}, #{b})"
# s を w 個 " | " で連結して末尾に改行を入れた文字列 line を生成
line = ([s] * w).join(" | ") + "\n"
# line を h 個 "=" * (9 * w - 3) で連結して
# 末尾に改行を追加した文字列 table を生成
# 6w + 3(w - 1) = 9w - 3
table = ([line] * h).join("=" * (9 * w - 3) + "\n")
# 出力
puts(table)
