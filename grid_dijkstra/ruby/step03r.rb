# 問題3: ダイクストラ法 - 経路復元 (paizaランク A 相当)

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
  queue = [[0, 0, cost, prev]]

  # 最短ルート検索
  searched = []
  route = []
  while queue.length > 0
    # コストの昇順で並べ替え
    # PriorityQueue を sort_by! で代用
    queue.sort_by! { |x| x[2] }
    # コストが一番小さい探索位置を取り出す
    y, x, tmp_cost, prev = queue.shift

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
    next if searched.any? { |a| a[0] == y && a[1] == x && a[2] == prev }

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
      queue << [ny, nx, tmp_cost + grid[ny][nx], [y, x]]
    end
  end

  # 出力用の文字列を生成する
  str_grid = grid.map { |line| line.map(&:to_s) }
  route_result = route.map do |ry, rx|
    output = ["--"]
    0.upto(h - 1) do |gy|
      line = str_grid[gy].dup
      if gy == ry
        line[rx] = "*" << line[rx]
      end
      output << line.map { |s| s.rjust(2) }.join
    end
    output
  end

  # 最短コストとルートを返す
  [cost, route_result].join("\n") << "\n"
end

puts solve(STDIN.read)

#puts solve(INPUT1)

=begin
入力例1
3 6
0 3 1 4 1 5
9 2 6 5 3 5
3 9 7 9 3 2

出力例1
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
=end
