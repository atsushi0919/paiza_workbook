# 問題2: ダイクストラ法 - 最短経路のコスト (paizaランク A 相当)
# https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d2

INPUT1 = <<~"EOS"
  3 6
  0 3 1 4 1 5
  9 2 6 5 3 5
  3 9 7 9 3 2
EOS
OUTPUT1 = <<~"EOS"
  12
EOS

INPUT2 = <<~"EOS"
  10 10
  0 0 0 1 0 1 0 0 0 0
  1 0 1 0 0 0 0 0 0 0
  0 0 0 1 0 1 1 1 1 1
  0 0 0 0 0 0 0 0 0 0
  1 1 1 0 1 0 1 1 1 1
  0 0 0 0 0 0 1 0 0 0
  0 1 1 1 1 1 1 1 1 0
  0 0 0 0 1 0 1 0 0 0
  1 1 1 0 0 0 1 0 1 0
  0 0 0 0 1 0 0 0 1 0
EOS

def solve(input_lines)
  # 設定
  dy = [-1, 0, 1, 0]
  dx = [0, 1, 0, -1]

  # 入力受け取り
  input_lines = input_lines.split("\n")
  h, w = input_lines.shift.split.map(&:to_i)
  grid = input_lines.each.map { |line| line.split.map(&:to_i) }

  # 最短ルート検索
  goal = [h - 1, w - 1]
  q = [[0, 0, grid[0][0]]]
  cost = -1
  searched = Array.new(h).map { Array.new(w) }
  while q.length > 0
    q.sort_by! { |data| data[2] }
    y, x, tmp_cost = q.shift
    searched[y][x] = true
    if goal == [y, x]
      cost = tmp_cost
      break
    end
    dy.zip(dx).each do |dy, dx|
      ny = y + dy
      nx = x + dx

      # 範囲外の判定
      next if ny < 0 || h - 1 < ny
      next if nx < 0 || w - 1 < nx
      # 探索済みの判定
      next if searched[ny][nx]
      # 探索候補に追加
      q << [ny, nx, tmp_cost + grid[ny][nx]]
    end
  end
  cost
end

puts solve(INPUT1)

=begin
問題2: ダイクストラ法 - 最短経路のコスト (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d2
問題文のURLをコピーする
 チャレンジする言語

Ruby
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
グリッド状の盤面で上下左右の移動を繰り返して、左上のスタートから右下のゴールまで移動するときに通るマスのコストの合計の最小値を求めてください。

※この問題は、paiza開発日誌で詳しく解説しています

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
コストの合計の最小値を 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ h , w ≦ 20
・0 ≦ t_{i,j} ≦ 100 (0 ≦ i < h, 0 ≦ j < w)

入力例1
3 6
0 3 1 4 1 5
9 2 6 5 3 5
3 9 7 9 3 2

出力例1
17
=end
