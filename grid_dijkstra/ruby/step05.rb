# 問題5: ゴールのマスが複数 (paizaランク A 相当)
# https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d5

class PriorityQueue
  attr_reader :data

  def initialize(array: [], key: 0)
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

class RouteMap
  VY = [-1, 0, 1, 0]
  VX = [0, 1, 0, -1]

  def initialize(size:, cost_data:)
    @size = size
    @cost_data = cost_data
  end

  def moving_cost(sy: 0, sx: 0)
    # 探索初期化
    cost = @cost_data[sy][sx]
    pqueue = PriorityQueue.new(array: [[sy, sx, cost]], key: 2)
    close = []
    reaching_cost = Array.new(@size[:w])

    while pqueue.size > 0
      # コストが一番小さい探索位置を取り出す
      y, x, cost = pqueue.extract

      # スタートから現在位置までの最小コストで確定
      close << [y, x]

      # reaching_cost の更新処理
      if y == @size[:h] - 1 && reaching_cost[x].nil?
        reaching_cost[x] = cost
      end

      # reaching_cost 計算終了
      unless reaching_cost.include?(nil)
        return reaching_cost
      end

      # 現在地の隣接4マスを調べる
      VY.zip(VX).each do |dy, dx|
        ny = y + dy
        nx = x + dx

        # マップ範囲外ならスキップ
        next unless valid_range?(ny, nx)

        # マップ内で未探索なら探索予定に追加
        unless close.include?([ny, nx])
          pqueue.insert([ny, nx, @cost_data[ny][nx] + cost])
        end
      end
    end
    # ゴール出来なかったら-1を返す
    return -1
  end

  # マップ内か？
  def valid_range?(y, x)
    (0...@size[:h]).include?(y) && (0...@size[:w]).include?(x)
  end
end

def solve(input_data)
  h, w = input_data.shift.split.map(&:to_i)
  cost_data = input_data.each.map do |line|
    line.split.map(&:to_i)
  end

  route_map = RouteMap.new(size: { h: h, w: w },
                           cost_data: cost_data)

  route_map.moving_cost
end

# データ入力
in1 = <<~"EOS"
  3 6
  0 3 1 4 1 5
  9 2 6 5 3 5
  3 9 7 9 3 2
EOS

puts solve(in1.split("\n"))
#puts solve(readlines.map(&:chomp))

=begin
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
