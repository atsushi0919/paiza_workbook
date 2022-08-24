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

def dfs(cv, nodes, edges)
  $ad_list[cv].each do |nv|
    # 通過済み経路はスキップ
    next if edges[cv][nv]
    next if edges[nv][cv]
    # 通れない頂点ならスキップ
    next if unused_vertices.include?(nv)

    # nv を通る
    nodes << nv
    edges[cv][nv] = true
    edges[nv][cv] = true
    # t に着いたら経路を記録
    if nv == $t
      # q を訪問した回数をカウント
      q_count = nodes.count($q)
      if q_count > $results[:q_count]
        # 現在の q_count より多いなら更新
        $results[:q_count] = q_count
        $results[:trails] = [nodes.dup]
      elsif q_count == $results[:q_count] && q_count > 0
        # 現在の q_count と同じなら経路を追加
        $results[:trails] << nodes.dup
      end
    end
    # 再帰呼び出し
    dfs(nv, nodes, edges)
    # nv を通らない
    nodes.pop
    edges[cv][nv] = false
    edges[nv][cv] = false
  end
end

input_str = INPUT1
input_lines = input_str.split("\n")
# n: 頂点数, s: 起点, t: 終点
n, $s, $t = input_lines.shift.split.map(&:to_i)
# 通らない頂点
unused_vertices = input_lines.shift(2).last.split.map(&:to_i)
# 隣接リスト
$ad_list = {}
input_lines.each.with_index(1) do |line, i|
  next if i.odd?
  $ad_list[i / 2] = line.split.map(&:to_i)
end

# s から t への経路
$results = [[]]
edges = Array.new(n + 1) { Array.new(n + 1, false) }
dfs($s, [$s], edges)

# 頂点数が一番多い経路または -1 を出力
results.last.length > 0 ? results.last.join(" ") : -1
