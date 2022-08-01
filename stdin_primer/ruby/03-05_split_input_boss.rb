# 【半角スペース区切りの入力】半角スペース区切りの 1,000 個の入力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/stdin_primer/stdin_primer__split_input_boss

# 入出力例
INPUT1 = <<~"EOS"
  FCrj 7A7SbR9i .. 省略 .. pNeapDUhm hQ7rm2yyo
EOS

OUTPUT1 = <<~"EOS"
  FCrj
  7A7SbR9i
  .
  .
  省略
  .
  .
  pNeapDUhm
  hQ7rm2yyo
EOS

# 解答例
# 入力
ary = gets.chomp.split(" ")
# 出力
puts(ary)
