# トレイルの通れない頂点 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step5

INPUT1 = <<~"EOS"
  5 1 4
  1
  3
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
OUTPUT1 = <<~"EOS"
  1 2 5 4
EOS

INPUT2 = <<~"EOS"
  4 1 4
  1
  2
  1
  2
  3
  1 3 4
  2
  2 4
  2
  2 3
EOS
OUTPUT2 = <<~"EOS"
  -1
EOS

INPUT3 = <<~"EOS"
  6 5 6
  1
  1
  5
  2 3 4 5 6
  5
  1 3 4 5 6
  5
  1 2 4 5 6
  5
  1 2 3 5 6
  5
  1 2 3 4 6
  5
  1 2 3 4 5
EOS
OUTPUT3 = <<~"EOS"
  5 4 6 2 4 3 5 2 3 6
EOS

Trail = Struct.new(:nodes, :edges)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 通らない頂点
  unused_vertices = input_lines.shift(2).last.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # s から t までの経路を調べる
  results = [[]]
  trails = [Trail.new([s], [])]
  while trails.length > 0
    trail = trails.pop
    # t に着いたら結果を記録
    if trail.nodes.last == t
      if trail.nodes.length > results.last.length
        results = [trail.nodes]
      elsif trail.nodes.length == results.last.length
        results << trail.nodes
      end
    end
    # 隣接頂点を調べる
    cv = trail.nodes.last
    ad_list[cv].each do |nv|
      e = [cv, nv].sort
      # 使ったことのある経路ならスキップ
      next if trail.edges.include?(e)
      # 通れない頂点
      next if unused_vertices.include?(nv)
      # trail を複製して情報更新
      new_trail = Marshal.load(Marshal.dump(trail))
      new_trail.nodes << nv
      new_trail.edges << e
      trails << new_trail
    end
  end
  # 頂点数が一番多い経路または -1 を出力
  results.last.length > 0 ? results.last.join(" ") : -1
end

puts main(STDIN.read)
