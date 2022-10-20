# グリッド版ダイクストラ問題1: 幅優先探索 - 迷路
# https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d1

INPUT1 = <<~"EOS"
  3 6
  0 0 1 0 0 0
  1 0 1 0 1 0
  0 0 0 0 1 0
EOS
OUTPUT1 = <<~"EOS"
  12
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

def solve(input_lines)
  # 方向設定
  dy = [-1, 0, 1, 0]
  dx = [0, 1, 0, -1]

  # 入力受け取り
  input_lines = input_lines.split("\n")
  h, w = input_lines.shift.split.map(&:to_i)
  grid = input_lines.map { |line| line.split }

  # ゴールの設定
  goal = [h - 1, w - 1]

  # 探索済みリスト, 探索候補リスト, コスト初期化
  searched = Array.new(h).map { Array.new(w) }
  pq = PriorityQueue.new([[0, 0, 1]], 2)
  cost = -1

  # 幅優先探索で最短ルート検索
  while pq.size > 0
    # 探索候補の先頭から位置情報を取り出す
    y, x, tmp_cost = pq.extract

    # ゴールなら仮のコストを確定させてループを抜ける
    if goal == [y, x]
      cost = tmp_cost
      break
    end

    # 探索済みの判定
    next if searched[y][x]
    # 探索済みの記録
    searched[y][x] = true

    # ゴールでなければ仮コストを +1 して隣接4マスを調べる
    tmp_cost += 1
    dy.zip(dx).each do |dy, dx|
      ny = y + dy
      nx = x + dx

      # 範囲外の判定
      next if ny < 0 || h - 1 < ny
      next if nx < 0 || w - 1 < nx
      # 障害物の判定
      if grid[ny][nx] == "1"
        searched[ny][nx] = true
        next
      end

      # 到達可能なら探索候補に追加
      pq.insert([ny, nx, tmp_cost])
    end
  end

  # 確定したコストを返す
  cost
end

puts solve(STDIN.read)

# puts solve(INPUT2)

=begin
問題1: 幅優先探索 - 迷路 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d1
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
グリッド状の盤面で上下左右の移動を繰り返して、左上のスタートから右下のゴールまで移動するときに通るマスの最小の個数を求めてください。
ただし、0のマスは通れて、1のマスは通れません。

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
・t_{i,j} は i 行目の j 列目の値です。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
ゴールまで移動するときに通るマスの最小の個数を 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ h , w ≦ 20
・0 ≦ t_{i,j} ≦ 1 (0 ≦ i < h, 0 ≦ j < w)

入力例1
3 6
0 0 1 0 0 0
1 0 1 0 1 0
0 0 0 0 1 0

出力例1
12
=end
