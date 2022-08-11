# パスの通れない頂点 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step6

INPUT1 = <<~"EOS"
  5 1 4
  3
  2 3 5
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
  -1
EOS

INPUT2 = <<~"EOS"
  5 5 3
  3
  1 2 4
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
  5 3
EOS

INPUT3 = <<~"EOS"
  8 1 5
  2
  3 7
  3
  2 3 7
  4
  1 3 7 8
  7
  1 2 4 5 6 7 8
  4
  3 6 7 8
  3
  3 6 7
  4
  3 4 5 7
  7
  1 2 3 4 5 6 8
  4
  2 3 4 7
EOS
OUTPUT3 = <<~"EOS"
  1 2 8 4 6 5
EOS

def dfs(s, t, ad_list, unused_vertices = [])
  # history の末尾 から t への経路を調べる
  results = []
  paths = [[s]]
  while paths.length > 0
    path = paths.pop
    if path.last == t
      results << path
      next
    end

    # 未訪問の隣接頂点に移動する
    cv = path.last
    ad_list[cv].each do |nv|
      # 訪問済の頂点はスキップ
      next if path.include?(nv)
      # 通れない頂点はスキップ
      next if unused_vertices.include?(nv)
      # 新しい経路を追加
      paths << path + [nv]
    end
  end
  results
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 通れない頂点
  unused_vertices = input_lines.shift(2).last.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # 始点 s から終点 t までの経路
  results = dfs(s, t, ad_list, unused_vertices)

  # 頂点が最も少ない経路または -1 を出力
  if results.length > 0
    # 経路の頂点数で昇順ソート
    results.sort { |a, b| a.length <=> b.length }
    # 最も頂点数が少ない経路を出力
    results.first.join(" ")
  else
    # 経路なしなら -1 を出力
    -1
  end
end

puts main(INPUT1)
# > -1
puts main(INPUT2)
# > 5 3
puts main(INPUT3)
# > 1 2 8 4 6 5
