# グラフのトレイル (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step1

INPUT1 = <<~"EOS"
  3 1 2
EOS
OUTPUT1 = <<~"EOS"
  1 2 3
EOS

INPUT2 = <<~"EOS"
  5 1 5
EOS
OUTPUT2 = <<~"EOS"
  1 5 3 4 5 2
EOS

INPUT3 = <<~"EOS"
  14 3 9
EOS

Trail = Struct.new(:nodes, :edges)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, k: 回数
  n, s, k = input_lines.shift.split.map(&:to_i)
  # 隣接リスト(完全無向グラフ)
  ad_list = Hash.new { [] }
  1.upto(n) do |i|
    1.upto(n) do |j|
      ad_list[i] <<= j if i != j
    end
  end

  # k 回移動
  edges = Array.new(n + 1) { Array.new(n + 1, false) }
  trails = [Trail.new([s], edges)]
  while trails.length > 0
    trail = trails.pop

    # k 回移動した経路を出力
    if trail.nodes.length == k + 1
      return trail.nodes.join(" ")
    end
    # 隣接頂点に移動する
    cv = trail.nodes.last
    ad_list[cv].each do |nv|
      # 使ったことのある経路ならスキップ
      next if trail.edges[cv][nv]
      next if trail.edges[nv][cv]

      # 新しい trail を trails に追加
      nodes = trail.nodes + [nv]
      edges = trail.edges.map(&:dup)
      edges[cv][nv] = true
      edges[nv][cv] = true
      trails << Trail.new(nodes, edges)
    end
  end
end

puts main(STDIN.read)
