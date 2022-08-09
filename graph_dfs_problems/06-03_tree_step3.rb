# 全域木の出力 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__tree_step3

INPUT1 = <<~"EOS"
  4
  1
  2
  3
  1 3 4
  2
  2 4
  2
  2 3
  1
  2 3
EOS
OUTPUT1 = <<~"EOS"
  1 2
  2 4
  4 3
EOS

INPUT2 = <<~"EOS"
  5
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
  3
  2 3
  3 5
  4 5
EOS
OUTPUT2 = <<~"EOS"
  -1
EOS

Path = Struct.new(:history, :edges)

# 全域木の経路を返す
def spanning_tree_path(s, ad_list, unused_edges)
  n = ad_list.length
  edges = Array.new(n + 1) { Array.new(n + 1, false) }
  s = Path.new([s], edges)
  paths = [s]
  while paths.length > 0
    path = paths.pop
    return path if path.history.length == n

    # 隣接頂点を調べる
    cn = path.history.last
    ad_list[cn].each do |nn|
      # 経路重複確認
      next if path.edges[cn][nn]
      # 頂点重複確認
      next if path.history.include?(nn)
      # 不使用枝確認
      next if unused_edges[cn][nn]

      # path を複製して情報更新
      new_path = Marshal.load(Marshal.dump(path))
      new_path.edges[cn][nn] = new_path.edges[nn][cn] = true
      new_path.history << nn
      paths << new_path
    end
  end
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.to_i
  # 隣接リスト
  ad_list = {}
  input_lines.shift(n * 2).each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end
  # 使わない枝
  unused_edges = Array.new(n + 1) { Array.new(n + 1, false) }
  input_lines[1..].each do |line|
    from, to = line.split.map(&:to_i)
    unused_edges[from][to] = true
    unused_edges[to][from] = true
  end

  # 全域木の経路を選択する
  path = []
  1.upto(n) do |s|
    path = spanning_tree_path(s, ad_list, unused_edges)
    next if path.nil?
    break if path.history.length == n
  end

  # 全域木の構成を返す
  path.nil? ? -1 : path.history.each_cons(2).map { |v| v.join(" ") }.join("\n")
end

puts main(STDIN.read)
