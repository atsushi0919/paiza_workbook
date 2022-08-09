# オイラー閉路の出力 (paizaランク A 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__cycle_step8

INPUT1 = <<~"EOS"
  4 1
  2
  2 4
  2
  1 3
  2
  2 4
  2
  1 3
EOS
OUTPUT1 = <<~"EOS"
  1 2 3 4 1
EOS

INPUT2 = <<~"EOS"
  5 4
  2
  3 5
  2
  3 5
  4
  1 2 4 5
  2
  3 5
  4
  1 2 3 4
EOS
OUTPUT2 = <<~"EOS"
  4 3 1 5 2 3 5 4
EOS

INPUT3 = <<~"EOS"
  9 4
  8
  2 3 4 5 6 7 8 9
  8
  1 3 4 5 6 7 8 9
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
EOS
OUTPUT3 = <<~"EOS"
  4 1 2 3 1 5 2 4 3 5 4 6 1 7 2 6 3 7 4 8 1 9 2 8 3 9 5 6 7 5 8 6 9 7 8 9 4
EOS

Path = Struct.new(:history, :edges)

def euler_path(s, edge_count, ad_list)
  paths = [s = Path.new([s], [])]
  while paths.length > 0
    path = paths.pop

    # オイラー閉路なら経路を返す
    if path.history[..-2].include?(path.history.last) \
      && path.edges.length == edge_count
      return path.history
    end

    # 隣接頂点を調べる
    cn = path.history.last
    ad_list[cn].each do |nn|
      # 同じ経路を通らない
      edge = [cn, nn].sort
      next if path.edges.include?(edge)

      # path を複製して情報更新
      new_path = Marshal.load(Marshal.dump(path))
      new_path.edges << edge
      new_path.history << nn
      paths << new_path
    end
  end
  []
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 始点
  n, s = input_lines.shift.split.map(&:to_i)
  # 隣接リスト、枝の数
  ad_list = {}
  edge_count = 0
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    edges = line.split.map(&:to_i)
    ad_list[idx / 2] = edges
    edge_count += edges.length
  end
  edge_count /= 2

  # オイラー閉路の経路
  path = euler_path(s, edge_count, ad_list)

  # 経路を出力
  path.join(" ")
end

puts main(STDIN.read)
