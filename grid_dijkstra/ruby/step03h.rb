# 問題3: ダイクストラ法 - 経路復元 (paizaランク A 相当)
# https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d3h

INPUT1 = <<~"EOS"
  3 6
  0 3 1 4 1 5
  9 2 6 5 3 5
  3 9 7 9 3 2
EOS
OUTPUT1 = <<~"EOS"
  17
  --
   0 3 1 4 1 5
   9 2 6 5 3 5
   3 9 7 9 3*2
  --
   0 3 1 4 1 5
   9 2 6 5 3 5
   3 9 7 9*3 2
  --
   0 3 1 4 1 5
   9 2 6 5*3 5
   3 9 7 9 3 2
  --
   0 3 1 4*1 5
   9 2 6 5 3 5
   3 9 7 9 3 2
  --
   0 3 1*4 1 5
   9 2 6 5 3 5
   3 9 7 9 3 2
  --
   0 3*1 4 1 5
   9 2 6 5 3 5
   3 9 7 9 3 2
  --
   0*3 1 4 1 5
   9 2 6 5 3 5
   3 9 7 9 3 2
  --
  *0 3 1 4 1 5
   9 2 6 5 3 5
   3 9 7 9 3 2
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
    if size > 0
      @data.unshift(@data.pop)
      down_heap
    end
    target_element
  end

  def size
    @data.length
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
    ((idx * 2) + 1) < size
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
  vy = [-1, 0, 1, 0]
  vx = [0, 1, 0, -1]

  # 入力受け取り
  input_lines = input_lines.split("\n")
  h, w = input_lines.shift.split.map(&:to_i)
  grid = input_lines.each.map { |line| line.split.map(&:to_i) }

  # ゴールの設定
  goal = [h - 1, w - 1]

  # スタート地点で探索リストを初期化
  cost = grid[0][0]
  prev = nil
  pq = PriorityQueue.new([[0, 0, cost, prev]], 2)

  # 最短ルート検索
  searched = []
  route = []
  while pq.size > 0
    # コストの昇順で並べ替え
    # コストが一番小さい探索位置を取り出す
    y, x, tmp_cost, prev = pq.extract

    # 取り出したノードがゴール
    if y == goal[0] && x == goal[1]
      # 最小コストを確定する
      cost = tmp_cost
      # ゴールからスタートの経路を復元する
      route << [y, x]
      until prev.nil?
        route << prev
        prev = searched.find { |point| point[0..1] == prev }[-1]
      end
      break
    end

    # 探索済みの判定
    next if searched.any? { |a| a[0] == y && a[1] == x }

    # スタートから現在位置までを確定
    searched << [y, x, prev]

    # 現在地の隣接4マスを調べる
    vy.zip(vx).each do |dy, dx|
      ny = y + dy
      nx = x + dx
      # 範囲外の判定
      next if ny < 0 || h - 1 < ny
      next if nx < 0 || w - 1 < nx

      # 探索候補に追加
      pq.insert([ny, nx, tmp_cost + grid[ny][nx], [y, x]])
    end
  end

  # 出力用の文字列を生成する
  str_route = route.map { |pos| pos.join(" ") }

  # 最短コストとルートを返す
  [cost] + str_route
end

puts solve(STDIN.read)


#puts solve(INPUT1)

=begin
問題3: ダイクストラ法 - 経路復元 (hard) (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d3h
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
この問題は前問 (問題3: ダイクストラ法 - 経路復元) の制約強化版です。

グリッド状の盤面で上下左右の移動を繰り返して、プレイヤーが左上のスタートから右下のゴールまで移動するときに通るマス (スタート、ゴール含む) のコストの合計の最小値を求めてください。
さらに対応する経路をゴールからスタートまでの順序で出力してください。なお、コストが最小になるような経路は複数存在する可能性がありますが、その場合はどの経路を出力しても正答となります。

※この問題は、paiza開発日誌で詳しく解説しています

▼　下記解答欄にコードを記入してみよう

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
コストの合計の最小値を 1 行目に出力してください。

続けて、ゴールからスタートまでの経路を以下のようにマスの並びとして出力してください。


y_1 x_1
y_2 x_2
...
y_n x_n


・ n は最短経路上のマスの数です。
・ (y_t, x_t) は、プレイヤーが上から y_t 行目、左から x_t 列目にいることを表しています。
・ (y_1, x_1) = (h-1, w-1), (y_n, x_n) = (0, 0) を満たしている必要があります。
・ コストが最小ではない・経路が不正 の場合は不正解となります。
条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ h , w ≦ 100
・ 0 ≦ t_{i,j} ≦ 100 (0 ≦ i < h, 0 ≦ j < w)

入力例1
3 6
0 3 1 4 1 5
9 2 6 5 3 5
3 9 7 9 3 2

出力例1
17
2 5
2 4
1 4
0 4
0 3
0 2
0 1
0 0
=end
