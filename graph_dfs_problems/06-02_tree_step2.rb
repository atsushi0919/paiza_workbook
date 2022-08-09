# 全域木の出力 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__tree_step2

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
  1 2
  2 3
  3 4
  4 5
EOS

INPUT3 = <<~"EOS"
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
OUTPUT3 = <<~"EOS"
EOS

# 全域木の経路を返す
def spanning_tree_path(s, ad_list)
  n = ad_list.length
  paths = [[s]]
  while paths.length > 0
    path = paths.pop
    return path if path.length == n

    # 隣接頂点を調べる
    cn = path.last
    ad_list[cn].each do |nn|
      # 同じ頂点は使わない
      next if path.include?(nn)
      paths << path + [nn]
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

  # 全域木の経路を選択する
  path = []
  1.upto(n) do |s|
    path = spanning_tree_path(s, ad_list)
    break if path.length == n
  end

  # 全域木の構成を返す
  path.each_cons(2).map { |v| v.join(" ") }.join("\n")
end

puts main(STDIN.read)
