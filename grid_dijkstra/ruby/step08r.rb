# 問題8: 全てのマスを連結するときの最小コスト (paizaランク A 相当)
# https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d8

INPUT1 = <<~"EOS"
  3 3
  3 1 4
  1 5 9
  2 6 5
EOS
OUTPUT1 = <<~"EOS"
  95
EOS

def solve(input_lines)
  # 方向設定
  vy = [-1, 0, 1, 0]
  vx = [0, 1, 0, -1]

  # 入力受け取り
  input_lines = input_lines.split("\n")
  h, w = input_lines.shift.split.map(&:to_i)
  grid = input_lines.shift(h).map { |line| line.split.map(&:to_i) }

  # 探索初期化
  total_cost = 0
  queue = [[0, 0, total_cost]]
  searched = []

  # 最小コスト
  while queue.length > 0
    # コストの昇順で並べ替え
    # PriorityQueue を sort_by! で代用
    queue.sort_by! { |x| x[2] }

    # コストが一番小さい探索位置を取り出す
    y, x, tmp_cost = queue.shift

    # スタートから現在位置までの最小コストで確定
    searched << [y, x]
    total_cost += tmp_cost

    # ノードを連結したら終了
    break if searched.length == h * w

    # 現在地の隣接4マスを調べる
    vy.zip(vx).each do |dy, dx|
      ny = y + dy
      nx = x + dx
      # 範囲外の判定
      next if ny < 0 || h - 1 < ny
      next if nx < 0 || w - 1 < nx
      # 探索済みの判定
      next if searched.include?([ny, nx])
      next if queue.any? { |a| a[0] == ny && a[1] == nx }
      joint_cost = grid[y][x] * grid[ny][nx]
      queue << [ny, nx, joint_cost]
    end
  end
  total_cost
end

puts solve(STDIN.read)

# puts solve(readlines.map(&:chomp))

=begin
問題8: 全てのマスを連結するときの最小コスト (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d8
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
グリッド状の盤面が与えられます。盤面上で2つのマスを連結するコストは2つのマスの数値の積です。
上下左右にマスを連結して、すべてのマスがマスを介して連結するための最小のコストを求めてください。

初期の盤面では各マスはいずれのマスとも連結していないものとします。

※この問題は、paiza開発日誌で詳しく解説しています

入力される値
h w
t_{0,0} t_{0,1} ... t_{0,w-1}
t_{1,0} t_{1,1} ... t_{1,w-1}
...
t_{h-1,0} t_{h-1,1} ... t_{h-1,w-1}


・ 1 行目には盤面の行数を表す h , 盤面の列数を表す w が与えられます。
・ 続く h 行のうち i 行目には、i 行目のマスの数値を表す整数値のリスト t_i が与えられます。
・ t_{i,j} は i 行目の j 列目のマスの数値です。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
最小のコストを 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ h , w ≦ 20
・ 0 ≦ t_{i,j} ≦ 100 (0 ≦ i < h, 0 ≦ j < w)

入力例1
3 3
3 1 4
1 5 9
2 6 5

出力例1
95
=end
