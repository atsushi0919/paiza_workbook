# グラフのトレイル 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_all_step1

INPUT1 = <<~"EOS"
  4 2 4
  1
  2
  3
  1 3 4
  2
  2 4
  2
  2 3
EOS
OUTPUT1 = <<~"EOS"
  2
  2 3 4 2 1
  2 4 3 2 1
EOS

INPUT2 = <<~"EOS"
  5 1 5
  2
  2 5
  3
  1 3 5
  3
  2 4 5
  2
  3 5
  4
  1 2 3 4
EOS
OUTPUT2 = <<~"EOS"
  14
  1 2 3 4 5 1
  1 2 3 4 5 2
  1 2 3 4 5 3
  1 2 3 5 4 3
  1 2 5 3 4 5
  1 2 5 4 3 2
  1 2 5 4 3 5
  1 5 2 3 4 5
  1 5 2 3 5 4
  1 5 3 2 5 4
  1 5 3 4 5 2
  1 5 4 3 2 1
  1 5 4 3 2 5
  1 5 4 3 5 2
EOS

INPUT3 = <<~"EOS"
  3 1 4
  2
  2 3
  2
  1 3
  2
  1 2
EOS
OUTPUT3 = <<~"EOS"
  0
EOS

INPUT4 = <<~"EOS"
  12 1 4
  7
  2 3 4 7 9 11 12
  10
  1 3 4 5 6 7 9 10 11 12
  8
  1 2 5 6 7 9 10 12
  5
  1 2 6 9 11
  7
  2 3 6 7 9 11 12
  9
  2 3 4 5 7 9 10 11 12
  9
  1 2 3 5 6 9 10 11 12
  1
  11
  10
  1 2 3 4 5 6 7 10 11 12
  7
  2 3 6 7 9 11 12
  9
  1 2 4 5 6 7 8 9 10
  8
  1 2 3 5 6 7 9 10
EOS

Trail = Struct.new(:history, :edges, :count)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, k: 回数
  n, s, k = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # k 回移動
  results = []
  trails = [Trail.new([s], Array.new(n + 1) { Array.new(n + 1, false) }, k)]
  while trails.length > 0
    trail = trails.pop
    if trail.history.count == k + 1
      # k 回移動した経路を記録
      results << trail.history
      next
    end
    # 隣接頂点を調べる
    cv = trail.history.last
    ad_list[cv].each do |nv|
      # 通過済み確認
      from, to = [cv, nv].sort
      next if trail.edges[from][to]
      # trail を複製して情報更新
      new_trail = Marshal.load(Marshal.dump(trail))
      new_trail.history << nv
      new_trail.edges[from][to] = true
      new_trail.count -= 1
      trails << new_trail
    end
  end
  # 経路数と経路を全て出力
  [results.length.to_s].concat(results.map { |e| e.join(" ") }).join("\n")
end

puts main(STDIN.read)
