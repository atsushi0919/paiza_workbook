# 問題4: 拡張ダイクストラ - コストを0にできるチケット (paizaランク A 相当)
# https://paiza.jp/works/mondai/grid_dijkstra/grid_dijkstra__d4

INPUT1 = <<~"EOS"
  5 12
  0 1 1 1 9 9 9 9 1 1 1 1
  1 1 1 1 1 9 9 9 1 9 9 1
  1 1 1 9 9 9 9 9 1 9 9 1
  9 2 9 9 1 1 1 1 1 9 9 1
  1 1 1 2 1 9 9 9 9 9 9 1
  0
EOS
OUTPUT1 = <<~"EOS"
  25
EOS

INPUT2 = <<~"EOS"
  5 12
  0 1 1 1 9 9 9 9 1 1 1 1
  1 1 1 1 1 9 9 9 1 9 9 1
  1 1 1 9 9 9 9 9 1 9 9 1
  9 2 9 9 1 1 1 1 1 9 9 1
  1 1 1 2 1 9 9 9 9 9 9 1
  1
EOS
OUTPUT2 = <<~"EOS"
  20
EOS

INPUT3 = <<~"EOS"
  20 20
  0 1 1 1 9 9 9 9 1 1 1 1 3 8 9 1 2 3 4 8
  1 1 1 1 1 9 9 9 1 9 9 1 8 7 9 2 8 7 9 5
  1 1 1 9 9 9 9 9 1 9 9 1 6 2 4 7 8 4 2 1
  9 2 9 9 1 1 1 1 1 9 9 1 7 2 3 9 2 3 3 2
  1 1 1 2 1 9 9 9 9 9 9 1 2 6 8 3 4 7 8 3
  3 1 1 1 9 9 9 9 1 1 1 1 3 8 9 1 2 3 4 8
  1 1 1 1 1 9 9 9 1 9 9 1 8 7 9 2 8 7 9 5
  1 1 1 9 9 9 9 9 1 9 9 1 6 2 4 7 8 4 2 1
  9 2 9 9 1 1 1 1 1 9 9 1 7 2 3 9 2 3 3 2
  1 1 1 2 1 9 9 9 9 9 9 1 2 6 8 3 4 7 8 3
  5 1 1 1 9 9 9 9 1 1 1 1 3 8 9 1 2 3 4 8
  1 1 1 1 1 9 9 9 1 9 9 1 8 7 9 2 8 7 9 5
  1 1 1 9 9 9 9 9 1 9 9 1 6 2 4 7 8 4 2 1
  9 2 9 9 1 1 1 1 1 9 9 1 7 2 3 9 2 3 3 2
  1 1 1 2 1 9 9 9 9 9 9 1 2 6 8 3 4 7 8 3
  2 1 1 1 9 9 9 9 1 1 1 1 3 8 9 1 2 3 4 8
  1 1 1 1 1 9 9 9 1 9 9 1 8 7 9 2 8 7 9 5
  1 1 1 9 9 9 9 9 1 9 9 1 6 2 4 7 8 4 2 1
  9 2 9 9 1 1 1 1 1 9 9 1 7 2 3 9 2 3 3 2
  1 1 1 2 1 9 9 9 9 9 9 1 2 6 8 3 4 7 8 3
  0
EOS
OUTPUT3 = <<~"EOS"
  18
EOS

INPUT4 = <<~"EOS"
  4 4
  0 1 1 9
  1 1 1 1
  1 1 1 9
  9 2 9 1
  1
EOS
OUTPUT4 = <<~"EOS"
  20
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
  vy = [-1, 0, 1, 0]
  vx = [0, 1, 0, -1]

  # 入力受け取り
  input_lines = input_lines.split("\n")
  h, w = input_lines.shift.split.map(&:to_i)
  grid = input_lines.shift(h).map { |line| line.split.map(&:to_i) }
  tickets = input_lines.shift.to_i

  # ゴールの設定
  goal = [h - 1, w - 1]

  # スタート地点で探索リストを初期化
  cost = grid[0][0]
  pq = PriorityQueue.new([[0, 0, cost, tickets]], 2)

  # 最小コストの探索
  searched = []
  while pq.size > 0
    # コストが一番小さい探索位置を取り出す
    y, x, tmp_cost, tickets = pq.extract

    # 取り出した位置がゴール
    if y == goal[0] && x == goal[1]
      # 最小コストを確定してループを抜ける
      cost = tmp_cost
      break
    end

    # 探索済み
    next if searched.include?([y, x, tmp_cost, tickets])

    # スタートから現在位置までを確定
    searched << [y, x, tmp_cost, tickets]
    # 現在地の隣接4マスを調べる
    vy.zip(vx).each do |dy, dx|
      ny = y + dy
      nx = x + dx
      # 範囲外の判定
      next if ny < 0 || h - 1 < ny
      next if nx < 0 || w - 1 < nx

      # チケットを使わず探索候補に追加
      pq.insert([ny, nx, tmp_cost + grid[ny][nx], tickets])
      # チケットを使い探索候補に追加
      pq.insert([ny, nx, tmp_cost, tickets - 1]) if tickets > 0
    end
    p pq.data
  end

  # 最小コストを出力
  cost
end

puts solve(INPUT2)
