# パスの経由地 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step5

INPUT1 = <<~"EOS"
  5 1 4 3
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
OUTPUT1 = <<~"EOS"
  5
  1 2 3 4
  1 2 3 5 4
  1 2 5 3 4
  1 5 2 3 4
  1 5 3 4
EOS

INPUT2 = <<~"EOS"
  5 5 3 1
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
  1
  5 1 2 3
EOS

INPUT3 = <<~"EOS"
  8 8 4 1
  1
  2
  7
  1 3 4 5 6 7 8
  6
  2 4 5 6 7 8
  6
  2 3 5 6 7 8
  6
  2 3 4 6 7 8
  6
  2 3 4 5 7 8
  6
  2 3 4 5 6 8
  6
  2 3 4 5 6 7
EOS
OUTPUT3 = <<~"EOS"
  0
EOS

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点, q: 中継点
  n, s, t, q = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # s → q → t の経路
  results = []
  paths = [[s]]
  while paths.length > 0
    path = paths.pop
    # q を経由して t に着いたら経路を記録
    if path.last == t && path.include?(q)
      results << path
      next
    end

    # 隣接頂点に移動する
    cv = path.last
    ad_list[cv].each do |nv|
      # 訪問済の頂点はスキップ
      next if path.include?(nv)
      paths << path + [nv]
    end
  end

  # 経路数と経路を全て出力
  [results.length.to_s].concat(results.map { |e| e.join(" ") }).join("\n")
end

puts main(STDIN.read)
