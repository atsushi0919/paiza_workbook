# 全域木の判定 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__tree_step1

INPUT1 = <<~"EOS"
  4
  2
  2 3
  1
  1
  2
  1 4
  1
  3
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  5
  1
  2
  1
  1
  2
  4 5
  2
  3 5
  2
  3 4
EOS
OUTPUT2 = <<~"EOS"
  No
EOS

INPUT3 = <<~"EOS"
  12
  3
  2 5 6
  4
  1 4 7 12
  1
  9
  4
  2 7 10 12
  3
  1 8 10
  2
  1 10
  3
  2 4 12
  2
  5 11
  3
  3 10 12
  5
  4 5 6 9 11
  2
  8 10
  4
  2 4 7 9
EOS
OUTPUT3 = <<~"EOS"
  No
EOS

Path = Struct.new(:history, :edges)

# 全域木か？
def spanning_tree?(s, ad_list)
  spanning_tree = false
  n = ad_list.length

  edges = Array.new(n + 1) { Array.new(n + 1, false) }
  s = Path.new([s], edges)
  paths = [s]
  connected = 1
  while paths.length > 0
    spanning_tree = true if connected == n
    path = paths.pop

    # 隣接頂点を調べる
    cn = path.history.last
    ad_list[cn].each do |nn|
      # 同じ経路は使わない
      next if path.edges[cn][nn]
      # 通過済みの頂点なら閉路
      return false if path.history.include?(nn)
      # path を複製して情報更新
      new_path = Marshal.load(Marshal.dump(path))
      new_path.edges[cn][nn] = new_path.edges[nn][cn] = true
      new_path.history << nn
      paths << new_path
      connected += 1
    end
  end
  spanning_tree
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

  # 全域木か判定し出力
  spanning_tree?(1, ad_list) ? "Yes" : "No"
end

puts main(STDIN.read)
