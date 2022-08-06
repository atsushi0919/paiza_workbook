# 連結成分の数 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__connect_step3

INPUT1 = <<~"EOS"
  3
  2
  2 3
  2
  1 3
  2
  1 2
EOS
OUTPUT1 = <<~"EOS"
  1
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
  2
EOS

INPUT3 = <<~"EOS"
  8
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
  4
EOS

require "set"

# 頂点 s が属する連結成分を調べる
def connected_components(s, ad_list)
  vertices = Set.new
  routes = [[s]]
  while routes.length > 0
    route = routes.pop
    cv = route.last
    vertices.add(cv)

    ad_list[cv].each do |nv|
      next if route.include?(nv)
      routes << route + [nv]
    end
  end
  vertices
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

  # 全頂点の接続状態を調べる
  components = []
  vertices = Set.new(1..n)
  while vertices.length > 0
    cv = vertices.to_a.first
    component = connected_components(cv, ad_list)
    components << component
    vertices -= component
  end
  # 連結成分数を出力
  components.length
end

puts main(STDIN.read)
