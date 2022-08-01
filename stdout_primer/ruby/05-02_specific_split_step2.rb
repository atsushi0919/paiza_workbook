# バーティカルライン区切りで 3 つの文字列を出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_step2

# 入出力例
INPUT1 = <<~"EOS"
  paiza
  kirishima
  kyoko
EOS
OUTPUT1 = <<~"EOS"
  paiza|kirishima|kyoko
EOS

INPUT2 = <<~"EOS"
  tvnmmtuzwn
  yykehmocjk
  vwsqozutch
EOS
OUTPUT2 = <<~"EOS"
  tvnmmtuzwn|yykehmocjk|vwsqozutch
EOS

# 解答例1
# 入力
ary = 3.times.map { gets.chomp }
# 出力
puts(ary.join("|"))

# 解答例2
# 入力
s1 = gets.chomp
s2 = gets.chomp
s3 = gets.chomp
# 出力
puts("#{s1}|#{s2}|#{s3}")

# 解答例3
# 入力
s1 = gets.chomp
s2 = gets.chomp
s3 = gets.chomp
# 出力
puts(s1 + "|" + s2 + "|" + s3)
