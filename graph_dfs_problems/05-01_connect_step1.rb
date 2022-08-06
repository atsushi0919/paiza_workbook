# 連結の判定 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__connect_step1

INPUT1 = <<~"EOS"
  3 1 2
  2
  2 3
  2
  1 3
  2
  1 2
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  5 1 5
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
  10 1 10
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

INPUT4 = <<~"EOS"
  12 1 7
  2
  3 5
  2
  3 10
  3
  1 2 10
  2
  6 9
  1
  1
  2
  4 8
  1
  12
  3
  6 10 12
  2
  4 11
  3
  2 3 8
  1
  9
  2
  7 8
EOS

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # s が t に連結しているか
  routes = [[s]]
  connect = false
  while routes.length > 0
    route = routes.pop
    cv = route.last
    if cv == t
      connect = true
      break
    end

    # 隣接頂点を調べる
    ad_list[cv].each do |nv|
      next if route.include?(nv)
      routes << route + [nv]
    end
  end
  # 出力
  connect ? "Yes" : "No"
end

puts main(STDIN.read)
