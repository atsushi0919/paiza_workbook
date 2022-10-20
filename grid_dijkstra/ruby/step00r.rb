# 問題0: グリッド上の移動 (paizaランク C 相当)
# https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d0

INPUT1 = <<~"EOS"
  2 5
  0 1 2 3 4
  5 6 7 8 9
EOS
OUTPUT1 = <<~"EOS"
  17
EOS

def solve(input_lines)
  # 方向の設定
  dy = [-1, 0, 1, 0]
  dx = [0, 1, 0, -1]
  d = ["U", "R", "D", "L"]

  # 問題文の移動指示
  requests = ["R", "D", "R", "U", "L"]

  # 入力受け取り
  input_lines = input_lines.split("\n")
  h, w = input_lines.shift.split.map(&:to_i)
  grid = input_lines.each.map { |line| line.split.map(&:to_i) }

  # 初期設定
  y, x = 0, 0
  cost = grid[y][x]

  # 移動, コスト計算
  requests.each do |request|
    idx = d.index(request)
    y += dy[idx]
    x += dx[idx]
    cost += grid[y][x]
  end

  # コスト出力
  cost
end

puts solve(STDIN.read)

=begin
問題0: グリッド上の移動 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d0
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
グリッド状の盤面の左上からスタートして、
「右、下、右、上、左」と順に移動したときの経路上のマスのコストの合計を求めてください。

経路上のマスには、スタートとゴールのマスも含むものとします。

※この問題は、paiza開発日誌で詳しく解説しています

▼　下記解答欄にコードを記入してみよう

入力される値
h w
t_{0,0} t_{0,1} ... t_{0,w-1}
t_{1,0} t_{1,1} ... t_{1,w-1}
...
t_{h-1,0} t_{h-1,1} ... t_{h-1,w-1}


・1 行目には盤面の行数を表す h , 盤面の列数を表す w が与えられます。
・続く h 行の各行では i 行目 (0 ≦ i < h) には、盤面が与えられます。
・t_{i,j} は i 行目の j 列目のコストです。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
コストの合計を 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ h , w ≦ 20
・1 ≦ t_{i,j} ≦ 100 (0 ≦ i < h, 0 ≦ j < w)

入力例1
2 5
0 1 2 3 4
5 6 7 8 9

出力例1
17
=end
