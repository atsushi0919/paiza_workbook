# 五目並べ (paizaランク B 相当)
# https://paiza.jp/works/mondai/prob60/tic_tac_toe_9

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
  ...X.
  ...X.
  ...X.
  ...X.
  OOOO.
EOS
OUTPUT3 = <<~"EOS"
  D
EOS

=begin
def solve(input_lines)
  # 入力データ受け取り
  # 横5ライン
  h_lines = input_lines.split("\n").map(&:chars)

  # 縦5ライン
  v_lines = h_lines.transpose

  # 斜め2ライン
  n = h_lines.length
  d_lines = [[], []]
  (0..n - 1).each do |i|
    d_lines[0].push(h_lines[i][i])
    d_lines[1].push(h_lines[n - 1 - i][i])
  end

  # 全ラインをまとめる
  all_lines = h_lines + v_lines + d_lines

  # 全ラインで勝者の判定を行う
  result = "D"
  all_lines.each do |line|
    if line.count("O") == n
      result = "O"
    elsif line.count("X") == n
      result = "X"
    end
    break if result != "D"
  end

  # 判定結果の末尾に改行を追加
  result << "\n"
end

# 確認用コード
p solve(INPUT1)
# > "O\n"
p solve(INPUT1) == OUTPUT1
# > true
p solve(INPUT2)
# > "X\n"
p solve(INPUT2) == OUTPUT2
# > true
p solve(INPUT3)
# > "D\n"
p solve(INPUT3) == OUTPUT3
# > true
=end

# [解答例2]

# 盤面情報を与えると横・縦・斜めの12ラインを返す
def all_lines(board)
  n = board.length

  # 縦5ライン
  v_lines = board.transpose

  # 斜め2ライン
  d_lines = [[], []]
  (0..n - 1).each do |i|
    d_lines[0].push(board[i][i])
    d_lines[1].push(board[n - 1 - i][i])
  end

  # 横5ライン・縦5ライン・斜め2ラインを配列にして返す
  board + v_lines + d_lines
end

# ラインの情報を与えると勝者を判定する
def winner(lines)
  lines.each do |line|
    if line.count("O") == 5
      return "O"
    elsif line.count("X") == 5
      return "X"
    end
  end
  return "D"
end

def solve(input_lines)
  # 入力データ受け取り
  board = input_lines.split("\n").map(&:chars)

  # 横5ライン・縦5ライン・斜め2ラインの配列を取得
  all_lines = all_lines(board)

  # 各ラインを調べて勝者を判定する
  result = winner(all_lines)

  # 判定結果の末尾に改行を追加
  result << "\n"
end

puts solve(STDIN.read)

# [参考 確認用コード]
#p solve(INPUT1)
#p solve(INPUT2)
#p solve(INPUT3)

=begin
五目並べ (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/tic_tac_toe_9
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
5行5列の五目並べの盤面が与えられます。

盤面の各マスには、"O"か"X"か"."が書かれています。

"O"と"X"は、それぞれプレイヤーの記号を表します。

同じ記号が縦か横か斜めに連続で5つ並んでいれば、その記号のプレイヤーが勝者となります。

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
・勝者が2人になる盤面が与えられることはありません

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
...X.
...X.
...X.
...X.
OOOO.

出力例3
D
=end
