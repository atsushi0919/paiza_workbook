# トレイルの経由地 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_all_step4

INPUT1 = <<~"EOS"
  4 1 4 2
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
  0
EOS

INPUT2 = <<~"EOS"
  5 1 2 5
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
  2
  1 5 3 4 5 2
  1 5 4 3 5 2
EOS

Trail = Struct.new(:history, :edges)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点, q: 中継点
  n, s, t, q = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # s から t への経路を調べる
  results = []
  trails = [Trail.new([s], Array.new(n + 1) { Array.new(n + 1, false) })]
  while trails.length > 0
    trail = trails.pop
    if trail.history.last == t && trail.history.count(q) > 1
      # 経路を記録
      results << trail.history
    end
    # 隣接頂点に移動する
    cv = trail.history.last
    ad_list[cv].each do |nv|
      # 通過済み確認
      from, to = [cv, nv].sort
      next if trail.edges[from][to]
      # trail を複製して情報更新
      new_trail = Marshal.load(Marshal.dump(trail))
      new_trail.history << nv
      new_trail.edges[from][to] = true
      trails << new_trail
    end
  end
  # 経路数と経路を全て出力
  [results.length.to_s].concat(results.map { |e| e.join(" ") }).join("\n")
end

puts main(STDIN.read)
