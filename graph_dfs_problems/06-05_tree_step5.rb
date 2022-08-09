# 次数が 2 以下の全域木の出力 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__tree_step5

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
EOS
OUTPUT1 = <<~"EOS"
  1 2
  2 3
  3 4
EOS

INPUT2 = <<~"EOS"
  5
  2
  2 5
  2
  1 5
  1
  5
  1
  5
  4
  1 2 3 4
EOS
OUTPUT2 = <<~"EOS"
  -1
EOS

INPUT3 = <<~"EOS"
  10
  9
  2 3 4 5 6 7 8 9 10
  9
  1 3 4 5 6 7 8 9 10
  8
  1 2 4 5 6 7 8 9
  8
  1 2 3 5 6 7 8 9
  8
  1 2 3 4 6 7 8 9
  8
  1 2 3 4 5 7 8 9
  8
  1 2 3 4 5 6 8 9
  8
  1 2 3 4 5 6 7 9
  8
  1 2 3 4 5 6 7 8
  2
  1 2
EOS
OUTPUT3 = <<~"EOS"
  1 3
  3 4
  4 5
  5 6
  6 7
  7 8
  8 9
  9 2
  2 10
EOS

Path = Struct.new(:history, :edges)

# 全域木の経路を返す
def spanning_tree_path(s, ad_list)
  n = ad_list.length
  edges = Array.new(n + 1) { Array.new(n + 1, false) }
  s = Path.new([s], edges)
  paths = [s]
  while paths.length > 0
    path = paths.pop
    if path.history.length == n
      return path.history
    end

    # 隣接頂点を調べる
    cn = path.history.last
    ad_list[cn].each do |nn|
      # スキップ条件
      next if path.edges[cn][nn]
      next if path.history.include?(nn)

      # path を複製して情報更新
      new_path = Marshal.load(Marshal.dump(path))
      new_path.edges[cn][nn] = new_path.edges[nn][cn] = true
      new_path.history << nn
      paths << new_path
    end
  end
  []
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.to_i
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # 次数が 2 以下の全域木の経路を調査する
  path = []
  1.upto(n) do |s|
    path = spanning_tree_path(s, ad_list)
    break if not path.empty?
  end

  # 次数が 2 以下の全域木の構成を生成して出力
  if not path.empty?
    path.each_cons(2).map { |v| v.join(" ") }.join("\n")
  else
    -1
  end
end

puts main(STDIN.read)
