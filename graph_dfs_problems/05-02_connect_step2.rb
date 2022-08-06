# グラフ全体の連結の判定 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__connect_step2

INPUT1 = <<~"EOS"
  3
  2
  2 3
  2
  1 3
  2
  1 2
EOS
INPUT21 = <<~"EOS"
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
  10
  7
  2 3 4 5 6 7 8
  7
  1 3 4 5 6 7 8
  7
  1 2 4 5 6 7 8
  7
  1 2 3 5 6 7 8
  7
  1 2 3 4 6 7 8
  7
  1 2 3 4 5 7 8
  7
  1 2 3 4 5 6 8
  7
  1 2 3 4 5 6 7
  1
  10
  1
  9
EOS
OUTPUT3 = <<~"EOS"
  No
EOS

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  connection = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
    connection[idx / 2] = false
  end

  # 全ての頂点が接続されているか
  routes = [[1]]
  while routes.length > 0
    route = routes.pop
    cv = route.last
    connection[cv] = true
    break if connection.values.all?

    # 隣接頂点を調べる
    ad_list[cv].each do |nv|
      next if route.include?(nv)
      routes << route + [nv]
    end
  end
  # 出力
  connection.values.all? ? "Yes" : "No"
end

puts main(STDIN.read)
