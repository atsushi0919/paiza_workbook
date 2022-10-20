# 問題5: ゴールのマスが複数 (paizaランク A 相当)
# https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d5

INPUT1 = <<~"EOS"
  3 6
  0 3 1 4 1 5
  9 2 6 5 3 5
  3 9 7 9 3 2
EOS
OUTPUT1 = <<~"EOS"
  12
  14
  17
  22
  15
  17
EOS

def solve(input_lines)
  # 方向設定
  vy = [-1, 0, 1, 0]
  vx = [0, 1, 0, -1]

  # 入力受け取り
  input_lines = input_lines.split("\n")
  h, w = input_lines.shift.split.map(&:to_i)
  grid = input_lines.shift(h).map { |line| line.split.map(&:to_i) }

  # 探索済みリスト, 探索候補リスト, コスト初期化
  searched = Array.new(h).map { Array.new(w) }
  queue = [[0, 0, grid[0][0]]]
  cost = Array.new(w)

  # 最短ルート検索
  while queue.length > 0
    # コストの昇順で並べ替え
    # PriorityQueue を sort_by! で代用
    queue.sort_by! { |x| x[2] }

    # コストが一番小さい探索位置を取り出す
    y, x, tmp_cost = queue.shift
    searched[y][x] = true

    # 取り出した位置がゴール
    if y == h - 1
      cost[x] = tmp_cost
      break unless cost.include?(nil)
    end
    vy.zip(vx).each do |dy, dx|
      ny = y + dy
      nx = x + dx

      # 範囲外の判定
      next if ny < 0 || h - 1 < ny
      next if nx < 0 || w - 1 < nx
      # 探索済みの判定
      next if searched[ny][nx]
      next if queue.any? { |a| a[0] == ny && a[1] == nx }
      # 探索候補に追加
      queue << [ny, nx, tmp_cost + grid[ny][nx]]
    end
  end
  cost
end

puts solve(STDIN.read)

#puts solve(readlines.map(&:chomp))

=begin
問題5: ゴールのマスが複数 (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d5
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
グリッド状の盤面で上下左右の移動を繰り返して、プレイヤーが左上のスタートから最下段のゴールへ移動するときのコストの合計の最小値を求めてください。
ゴールはw個あるので、それぞれのゴールにへ移動する最小コストを求めてください。

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
次の形式で最下段のw個の各ゴールへの最小値を改行区切りで出力してください。

```
t_{h-1,0}へ移動するコストの最小値
t_{h-1,1}へ移動するコストの最小値
...
t_{h-1,w}へ移動するコストの最小値
```

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
12
14
17
22
15
17
=end
