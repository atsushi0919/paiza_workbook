# グラフの s,t パス 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step4

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
  7
  1 2 3 4
  1 2 3 5 4
  1 2 5 3 4
  1 2 5 4
  1 5 2 3 4
  1 5 3 4
  1 5 4
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
  4
  5 1 2 3
  5 2 3
  5 3
  5 4 3
EOS

def dfs(cv, nodes)
  $ad_list[cv].each do |nv|
    # 訪問済の頂点はスキップ
    next if nodes.include?(nv)
    # nv を通る
    nodes << nv
    if nv == $t
      # t に着いたら経路を記録
      $results << nodes.dup
    else
      # 次の層を探索
      dfs(nv, nodes)
    end
    # nv を通らない
    nodes.pop
  end
end

input_str = STDIN.read
input_lines = input_str.split("\n")
# n: 頂点数, s: 起点, t: 終点
n, s, $t = input_lines.shift.split.map(&:to_i)
# 隣接リスト
$ad_list = {}
input_lines.each.with_index(1) do |line, i|
  next if i.odd?
  $ad_list[i / 2] = line.split.map(&:to_i)
end

# s から t までの経路
$results = []
dfs(s, [s])

# 経路数と経路を全て出力
puts [$results.length.to_s].concat($results.map { |e| e.join(" ") }).join("\n")
