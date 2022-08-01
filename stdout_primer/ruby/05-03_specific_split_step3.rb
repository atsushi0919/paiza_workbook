# カンマ区切りで 10 個出力 1 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_step3

# 入出力例
INPUT1 = <<~"EOS"
  0 1 2 3 4 5 6 7 8 9
EOS
OUTPUT1 = <<~"EOS"
  0,1,2,3,4,5,6,7,8,9,
EOS

INPUT2 = <<~"EOS"
  994 267 101 579 874 986 32 528 253 822
EOS
OUTPUT2 = <<~"EOS"
  994,267,101,579,874,986,32,528,253,822,
EOS

# 解答例1
# 入力
ary = gets.split.map(&:to_i)
# ary 先頭から順に参照する
s = ""
ary.each do |n|
  # 文字列 s に 文字列に変換した n を追加
  s += n.to_s
  # 文字列 s に "," を追加
  s += ","
end
# 出力
puts(s)

# 解答例2
# 入力
ary = gets.split.map(&:to_i)
# 出力
puts(ary.join(",") + ",")
