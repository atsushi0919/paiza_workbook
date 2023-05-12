# 五目並べ(横) (paizaランク C 相当)
# https://paiza.jp/works/mondai/prob60/tic_tac_toe_2

INPUT1 = <<~"EOS"
  XXOXO
  OXOXX
  OOOOO
  OXOX.
  XOXXO
EOS
OUTPUT1 = <<~"EOS"
  O
EOS

INPUT2 = <<~"EOS"
  XXOXO
  OXOXX
  .OXXO
  OXOO.
  XXXXX
EOS
OUTPUT2 = <<~"EOS"
  X
EOS

INPUT3 = <<~"EOS"
  O.O.X
  OXX.X
  O.X.X
  OO..X
  X.XOX
EOS
OUTPUT3 = <<~"EOS"
  D
EOS

# [解答例1]
N = 5
h_lines = N.times.map { gets.chomp }

result = "D"
h_lines.each do |line|
  if line.count("O") == 5
    result = "O"
    break
  elsif line.count("X") == 5
    result = "X"
    break
  end
end

puts result

# [解答例2]
N = 5
h_lines = N.times.map { gets.chomp.chars }
result = "D"
h_lines.each do |line|
  if line.count("O") == 5
    result = "O"
    break
  elsif line.count("X") == 5
    result = "X"
    break
  end
end

puts result

# [解答例3]
def solve(input_lines)
  h_lines = input_lines.split("\n").map(&:chars)

  n = h_lines.length
  result = "D"
  h_lines.each do |line|
    if line.count("O") == n
      result = "O"
      break
    elsif line.count("X") == n
      result = "X"
      break
    end
  end
  result
end

puts solve(STDIN.read)

# [参考 確認用コード]
# puts solve(INPUT1)
# puts solve(INPUT2)
# puts solve(INPUT3)

=begin
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
5行5列の五目並べの盤面が与えられます。

盤面の各マスには、"O"か"X"か"."が書かれています。

"O"と"X"は、それぞれプレイヤーの記号を表します。

同じ記号が横に連続で5つ並んでいれば、その記号のプレイヤーが勝者となります。

勝者の記号を1行で表示してください。
勝者がいない場合は、引き分けとして、"D"を表示してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

s_1
s_2
s_3
s_4
s_5


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
勝者の記号を1行で表示してください。
勝者がいない場合は、引き分けとして、"D"を表示してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・s_iの文字数は5文字
・s_iに含まれる文字は"O"か"X"か"."のいずれか
・勝者が2人になる盤面が、与えられることはありません。

入力例1
XXOXO
OXOXX
OOOOO
OXOX.
XOXXO

出力例1
O

入力例2
XXOXO
OXOXX
.OXXO
OXOO.
XXXXX

出力例2
X

入力例3
O.O.X
OXX.X
O.X.X
OO..X
X.XOX

出力例3
D
=end
