# 【マップの扱い 1】マップの書き換え・1 マス (paizaランク C 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__get_one

# # 解答例1-1
# # 入力
# h, w = gets.split.map(&:to_i)
# board = h.times.map { gets.chomp.chars }
# y, x = gets.split.map(&:to_i)

# # 盤面書き換え
# if board[y][x] == "."
#   board[y][x] = "#"
# else
#   board[y][x] = "."
# end

# # 出力
# board.each { |row| puts row.join }

# # 解答例1-2
# 入力
input_lines = $stdin.read.split("\n")
h, w = input_lines.shift.split.map(&:to_i)
board = input_lines.shift(h).map(&:chars)
y, x = input_lines.shift.split.map(&:to_i)

# 盤面書き換え
board[y][x] = board[y][x] == "." ? "#" : "."

# 出力
puts board.map { |row| row.join }.join("\n")

=begin
行数 H , 列数 W の盤面があり、各マスには文字が 1 つだけ書かれています。盤面と y , x 座標 が与えられるので、
盤面の与えられた座標の文字が "." の場合は "#" に、"#" の場合は "." に書き換えた後の盤面を出力してください。

なお、マスの座標系は左上端のマスの座標を ( y , x ) = ( 0 , 0 ) とし、
下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。

▼　下記解答欄にコードを記入してみよう

入力される値
H W
S_0
...
S_(H-1)
y x


・ 1 行目には盤面の行数を表す整数 H , 盤面の列数を表す整数 W が与えられます。
・ 続く H 行には、盤面の i 行目の文字をまとめた文字列 S_i が与えられ、
S_i の j 文字目は、盤面の i 行目の j 列目に書かれている文字を表します。(0 ≦ i < H, 0 ≦ j < W)
・ 続く 1 行 には、 文字を書き換えるマスの y , x 座標が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
H 行での出力

・ 書き換えた後の盤面を H 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ H , W ≦ 20
・ 0 ≦ y < H, 0 ≦ x < W
・ S_i は W 文字の文字列 (0 ≦ i < H)
・ S_i の各文字は "." または "#" (0 ≦ i < H)

入力例1
3 3
...
...
...
0 0

出力例1
#..
...
...

入力例2
4 4
####
####
....
##..
2 2

出力例2
####
####
..#.
##..
=end
