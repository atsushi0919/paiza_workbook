# 【マップの扱い 4】マップのナンバリング (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__grid_numbering

# 方向設定
DIRECTION = [
  [[[1, 0], [0, 1]], [-1, 1]],  # D = 1
  [[[1, 0]], [0, 1]],           # D = 2
  [[[0, 1]], [1, 0]],           # D = 3
  [[[0, 1], [1, 0]], [1, -1]],  # D = 4
]

def valid_coordinate?(h, w, y, x)
  0 <= y && y < h && 0 <= x && x < w
end

# 入力
h, w, d = gets.split.map(&:to_i)

# 初期設定
board = Array.new(h) { Array.new(w) }   # 盤面
line_feed, (dy, dx) = DIRECTION[d - 1]  # 改行方向, セル移動方向
ldy, ldx = line_feed.shift              # 改行方向
hy = hx = 0                             # 行頭座標
cy = cx = 0                             # 現在座標
num = 0                                 # 番号
finish_loop = false                     # ループ脱出用

loop do
  # 番号を入れる
  board[cy][cx] = num += 1 if board[cy][cx].nil?

  # 移動先の座標を調べる
  cy += dy
  cx += dx
  # 移動先が盤面内なら移動
  next if valid_coordinate?(h, w, cy, cx)

  # 移動先が盤面外なら改行可能か調べる
  loop do
    cy = hy + ldy
    cx = hx + ldx
    if valid_coordinate?(h, w, cy, cx)
      # 現在の改行方向で改行できる
      hy, hx = cy, cx
    else
      # 現在の改行方向で改行できない
      if line_feed.length > 0
        # 改行方向変更
        ldy, ldx = line_feed.shift
        next
      else
        finish_loop = true
      end
    end
    break
  end
  break if finish_loop
end

# 出力
puts board.map { |row| row.join(" ") }.join("\n")

=begin
マップの行数 H と列数 W とナンバリングの向き D が与えられるので、(0, 0) から指示通りにナンバリングしたとき、
マップ全体にどのように番号が振られるかを出力してください。

ナンバリングの向き D に対応する方向と、例として 3×4 のマップをナンバリングをした結果は以下の通りです。



・D = 1 の場合



・D = 2 の場合



・D = 3 の場合



・D = 4 の場合



なお、マスの座標系は左上端のマスの座標を ( y , x ) = ( 0 , 0 ) とし、
下方向が y 座標の正の向き、右方向が x 座標の正の向きとします。

▼　下記解答欄にコードを記入してみよう

入力される値
H W D


・ 1 行目に盤面の行数を表す整数 H , 盤面の列数を表す整数 W , ナンバリングの向きを表す整数 D が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・ ナンバリングされたマップ全体を H 行で出力してください。
・ 要素間は半角スペースで区切ってください、詳しくは入出力例を参考にしてください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ H, W ≦ 10
・ 1 ≦ D ≦ 4

入力例1
4 4 1

出力例1
1 3 6 10
2 5 9 13
4 8 12 15
7 11 14 16

入力例2
3 5 2

出力例2
1 2 3 4 5
6 7 8 9 10
11 12 13 14 15

入力例3
2 2 3

出力例3
1 3
2 4

入力例4
2 5 4

出力例4
1 2 4 6 8
3 5 7 9 10
=end
