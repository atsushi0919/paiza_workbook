# グラフの最長 s,t トレイル (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step3

INPUT1 = <<~"EOS"
  5 1 4
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
  1 5 3 2 5 4
EOS

INPUT2 = <<~"EOS"
  5 5 3
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
  5 4 3 2 1 5 3
EOS

INPUT3 = <<~"EOS"
  6 5 6
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
  5 4 6 3 5 1 2 4 3 1 6 2 5 6
EOS

def dfs(cv, nodes, edges)
  $ad_list[cv].each do |nv|
    # 通過済み経路はスキップ
    next if edges[cv][nv]
    next if edges[nv][cv]

    # nv を通る
    nodes << nv
    edges[cv][nv] = true
    edges[nv][cv] = true
    if nv == $t
      # t に着いたら経路を記録
      $results << nodes.dup
    end
    # 再帰呼び出し
    dfs(nv, nodes, edges)
    # nv を通らない
    nodes.pop
    edges[cv][nv] = false
    edges[nv][cv] = false
  end
end

input_str = STDIN.read
input_lines = input_str.split("\n")
# n: 頂点数, s: 起点, t: 終点
n, $s, $t = input_lines.shift.split.map(&:to_i)
# 隣接リスト
$ad_list = {}
input_lines.each.with_index(1) do |line, i|
  next if i.odd?
  $ad_list[i / 2] = line.split.map(&:to_i)
end

# s から t への経路
$results = []
edges = Array.new(n + 1) { Array.new(n + 1, false) }
dfs($s, [$s], edges)

# 頂点数が一番多い多い経路から 1 つを出力
puts $results.sort { |a, b| a.length <=> b.length }.last.join(" ")
