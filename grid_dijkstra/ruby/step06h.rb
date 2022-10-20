# 問題6: 1つの中継点 (paizaランク A 相当)
# https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d6h
INPUT1 = <<~"EOS"
  4 5
  1 5 9 5 1
  2 9 1 2 2
  1 9 2 9 9
  2 2 1 1 1
EOS
OUTPUT1 = <<~"EOS"
  27
EOS

class PriorityQueue
  attr_reader :data

  def initialize(array = [], key = 0)
    @data = []
    @key = key
    array.each { |element| insert(element) }
  end

  def insert(element)
    @data << element
    up_heap
  end

  def extract
    target_element = @data.shift
    if size > 1
      @data.unshift @data.pop
      down_heap
    end
    target_element
  end

  def peek
    @data[0]
  end

  def size
    @data.size
  end

  private

  def swap(a, b)
    @data[a], @data[b] = @data[b], @data[a]
  end

  def parent_idx(idx)
    idx / 2 + idx % 2 - 1
  end

  def left_child_idx(idx)
    (idx * 2) + 1
  end

  def right_child_idx(idx)
    (idx * 2) + 2
  end

  def has_child?(idx)
    ((idx * 2) + 1) < @data.size
  end

  def up_heap
    idx = size - 1
    return if idx == 0
    parent_idx = parent_idx(idx)
    while @data[parent_idx][@key] > @data[idx][@key]
      swap(parent_idx, idx)
      return if parent_idx == 0
      idx = parent_idx
      parent_idx = parent_idx(idx)
    end
  end

  def down_heap
    idx = 0
    while (has_child?(idx))
      l_idx = left_child_idx(idx)
      r_idx = right_child_idx(idx)
      if @data[r_idx].nil?
        target_idx = l_idx
      else
        target_idx = @data[l_idx][@key] <= @data[r_idx][@key] ? l_idx : r_idx
      end
      if @data[idx][@key] > @data[target_idx][@key]
        swap(idx, target_idx)
        idx = target_idx
      else
        return
      end
    end
  end
end

def calc_cost(start, goal, grid, relay_point = false)
  # grid設定
  vy = [-1, 0, 1, 0]
  vx = [0, 1, 0, -1]
  h = grid.length
  w = grid[0].length

  # 探索済みリスト, 探索候補リスト, コスト初期化
  searched = Array.new(h).map { Array.new(w) }
  pq_check = Array.new(h).map { Array.new(w, false) }
  cost = relay_point ? 0 : grid[start[0]][start[1]]
  pq_check[0][0] = true

  pq = PriorityQueue.new([start << cost], 2)

  # 最短ルート検索
  while pq.size > 0
    # コストが一番小さい探索位置を取り出す
    y, x, tmp_cost = pq.extract
    pq_check[y][x] = false

    # 取り出した位置がゴール
    if goal == [y, x]
      return tmp_cost
    end

    # 探索済み
    searched[y][x] = true

    # 現在地の隣接4マスを調べる
    vy.zip(vx).each do |dy, dx|
      ny = y + dy
      nx = x + dx

      # 範囲外の判定
      next if ny < 0 || h - 1 < ny
      next if nx < 0 || w - 1 < nx
      # 探索済みの判定
      next if searched[ny][nx]
      # 探索候補重複の判定
      next if pq_check[ny][nx]
      # 探索候補に追加
      pq_check[ny][nx] = true
      pq.insert([ny, nx, tmp_cost + grid[ny][nx]])
    end
  end
end

def solve(input_lines)
  # 入力受け取り
  input_lines = input_lines.split("\n")
  h, w = input_lines.shift.split.map(&:to_i)
  grid = input_lines.shift(h).map { |line| line.split.map(&:to_i) }

  # 位置設定
  start = [0, 0]
  relay_point = [0, w - 1]
  goal = [h - 1, w - 1]

  # start から relay_point まで
  cost1 = calc_cost(start, relay_point, grid)
  # relay_point から goal まで
  cost2 = calc_cost(relay_point, goal, grid, relay_point = true)

  # start から goal までのコスト
  cost1 + cost2
end

puts solve(STDIN.read)

# puts solve(INPUT1)

=begin
問題6: 1つの中継点 (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d6
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
グリッド状の盤面で上下左右の移動を繰り返して、プレイヤーが左上のスタートから右上のマスを経由して右下のゴールまで移動するときに通る各マス (スタート、ゴール含む) の
コストの合計の最小値を求めてください。

※この問題は、paiza開発日誌で詳しく解説しています

入力される値
h w
t_{0,0} t_{0,1} ... t_{0,w-1}
t_{1,0} t_{1,1} ... t_{1,w-1}
...
t_{h-1,0} t_{h-1,1} ... t_{h-1,w-1}


・ 1 行目には盤面の行数を表す h , 盤面の列数を表す w が与えられます。
・ 続く h 行のうち i 行目には、i 行目のマスのコストを表す整数値のリスト t_i が与えられます。
・ t_{i,j} は i 行目の j 列目のコストです。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
コストの合計の最小値を 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ h , w ≦ 20
・ 0 ≦ t_{i,j} ≦ 100 (0 ≦ i < h, 0 ≦ j < w)

入力例1
4 5
1 5 9 5 1
2 9 1 2 2
1 9 2 9 9
2 2 1 1 1

出力例1
27
=end
