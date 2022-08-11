# グラフの s,t パス (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step4

INPUT1 = <<~"EOS"
  5 1 4
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
  1 5 4
EOS

INPUT2 = <<~"EOS"
  5 5 3
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

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # s から t への経路を調べる
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
      # 新しい経路を追加
      paths << path + [nv]
    end
  end
  # s から t に行ける経路を頂点数で昇順ソート
  results.sort! { |a, b| a.length <=> b.length }
  # 最も頂点数が少ない経路を出力
  results.first.join(" ")
end

puts main(INPUT1)
# > 1 5 4
puts main(INPUT2)
# > 5 3
