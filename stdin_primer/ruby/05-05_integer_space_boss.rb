# 【整数の半角スペース区切りの入力】1,000個の整数の半角スペース区切りの入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__integer_space_boss

# 入出力例
INPUT1 = <<~"EOS"
  5294 3387 . 省略 . 4430 4344
EOS
OUTPUT1 = <<~"EOS"
  5294
  3387
  .
  省略
  .
  4430
  4344
EOS

# 解答例
# 入力
ary = gets.split.map(&:to_i)
# 出力
puts ary
