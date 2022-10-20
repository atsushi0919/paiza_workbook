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
  2
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
  20
EOS
OUTPUT3 = <<~"EOS"
  18
EOS

INPUT4 = <<~"EOS"
  5 5
  0 1 1 1 9
  1 1 1 1 1
  1 1 1 9 9
  9 2 9 9 1
  1 1 1 2 1
  2
EOS
OUTPUT4 = <<~"EOS"
  20
EOS

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
  queue = [[0, 0, cost, tickets]]

  # 最小コストの探索
  searched = []
  while queue.length > 0
    # コストの昇順で並べ替え
    # PriorityQueue を sort_by! で代用
    queue.sort_by! { |x| x[2] }
    # コストが一番小さい探索位置を取り出す
    y, x, tmp_cost, tickets = queue.shift

    # 取り出した位置がゴール
    if y == goal[0] && x == goal[1]
      # 最小コストを確定してループを抜ける
      cost = tmp_cost
      break
    end

    # チケットが足りないならスキップ
    skip = false
    searched.each do |sy, sx, st|
      if y == sy && x == sx && st > tickets - 1
        skip = true
        break
      end
    end
    next if skip

    # スタートから現在位置までを確定
    searched << [y, x, tickets]
    # 現在地の隣接4マスを調べる
    vy.zip(vx).each do |dy, dx|
      ny = y + dy
      nx = x + dx
      # 範囲外の判定
      next if ny < 0 || h - 1 < ny
      next if nx < 0 || w - 1 < nx
      # 探索済みの判定
      # チケットを使わず探索候補に追加
      if !searched.include?([ny, nx, tickets])
        queue << [ny, nx, tmp_cost + grid[ny][nx], tickets]
      end
      # チケットを使い探索候補に追加
      if !searched.include?([ny, nx, tickets - 1]) && 0 < tickets
        queue << [ny, nx, tmp_cost, tickets - 1]
      end
    end
    # 探索候補重複を削除
    queue.uniq!
  end

  # 最小コストを出力
  cost
end

puts solve(STDIN.read)
