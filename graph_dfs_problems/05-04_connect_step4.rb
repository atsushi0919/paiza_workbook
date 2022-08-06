# 連結成分の大きさ (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__connect_step4

INPUT1 = <<~"EOS"
  3 2
  2
  2 3
  2
  1 3
  2
  1 2
EOS
OUTPUT1 = <<~"EOS"
  No
EOS

INPUT2 = <<~"EOS"
  5 3
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
  Yes
EOS

INPUT3 = <<~"EOS"
  8 2
  1
  2
  1
  1
  1
  4
  1
  3
  1
  6
  1
  5
  1
  8
  1
  7
EOS
OUTPUT3 = <<~"EOS"
  Yes
EOS

require "set"

# 頂点 s が属する連結成分が k 以下かを調べる
def connected_components(s, k, ad_list)
  vertices = Set.new
  routes = [[s]]
  while routes.length > 0
    route = routes.pop
    cv = route.last
    vertices.add(cv)
    return false if vertices.length > k

    ad_list[cv].each do |nv|
      next if route.include?(nv)
      routes << route + [nv]
    end
  end
  [true, vertices]
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, 連結成分数閾値
  n, k = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # 全頂点の接続状態を調べる
  le_k = true
  vertices = Set.new(1..n)
  while vertices.length > 0
    cv = vertices.to_a.first
    le_k, component = connected_components(cv, k, ad_list)
    le_k ? vertices -= component : break
  end
  # 全ての連結成分数が k 以下かを出力
  le_k ? "Yes" : "No"
end

puts main(STDIN.read)
