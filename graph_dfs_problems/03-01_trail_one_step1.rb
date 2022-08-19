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
  # 隣接リスト
  ad_list = Hash.new { [] }
  1.upto(n) do |i|
    1.upto(n) do |j|
      ad_list[i] <<= j if i != j
    end
  end

  # k 回移動
  edges = Array.new(n) { Array.new(n, false) }
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
      next if trail.edges[cv - 1][nv - 1]
      next if trail.edges[nv - 1][cv - 1]
      # trail を複製して情報更新
      new_trail = Marshal.load(Marshal.dump(trail))
      new_trail.nodes << nv
      new_trail.edges[cv - 1][nv - 1] = true
      new_trail.edges[nv - 1][cv - 1] = true
      trails << new_trail
    end
  end
end

puts main(INPUT3)
