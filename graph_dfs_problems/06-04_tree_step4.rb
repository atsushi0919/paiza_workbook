# 全域木の出力 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__tree_step4

INPUT1 = <<~"EOS"
  4
  1
  4
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
  1 2
  2 3
EOS

INPUT2 = <<~"EOS"
  5
  3
  2 3 5
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
  -1
EOS

Path = Struct.new(:history, :edges)

# 全域木の経路を返す
def spanning_tree_path(s, ad_list, unused_nodes = [])
  n = ad_list.length
  edges = Array.new(n + 1) { Array.new(n + 1, false) }
  results = []
  connected = {}
  ad_list.keys.each do |v|
    unless unused_nodes.include?(v)
      connected[v] = false
    end
  end
  connected[s] = true
  s = Path.new([s], edges)
  paths = [s]
  while paths.length > 0
    end_point = true
    path = paths.pop
    if connected.values.all?
      paths.each { |path| results << path.history }
      results << path.history
      return [true, results]
    end

    # 隣接頂点を調べる
    cn = path.history.last
    ad_list[cn].each do |nn|
      # スキップ条件
      next if path.edges[cn][nn]
      next if path.history.include?(nn)
      next if unused_nodes.include?(nn)

      # path を複製して情報更新
      new_path = Marshal.load(Marshal.dump(path))
      new_path.edges[cn][nn] = new_path.edges[nn][cn] = true
      new_path.history << nn
      paths << new_path
      connected[nn] = true
      end_point = false
    end
    results << path.history if end_point
  end
  false
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.to_i
  # 通らない頂点
  unused_nodes = input_lines.shift(2).last.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # 全域木の経路を調査する
  s = (1..n).find { |v| not unused_nodes.include?(v) }
  sp_tree, paths = spanning_tree_path(s, ad_list, unused_nodes)

  # 全域木の構成を生成して出力
  if sp_tree
    connected = [s]
    sp_tree_path = []
    paths.each do |path|
      path.each_cons(2) do |a, b|
        next if connected.include?(b)
        connected << b
        sp_tree_path << [a, b]
      end
    end
    sp_tree_path.map { |v| v.join(" ") }.join("\n")
  else
    -1
  end
end

puts main(STDIN.read)
