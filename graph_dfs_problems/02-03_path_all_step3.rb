# グラフのパス 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step3

INPUT1 = <<~"EOS"
  4 2 4
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
  0
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
  4
  5 1 2 3
  5 2 3 4
  5 3 2 1
  5 4 3 2
EOS

INPUT3 = <<~"EOS"
  7 1 3
  6
  2 3 4 5 6 7
  2
  1 7
  2
  1 4
  2
  1 3
  2
  1 6
  2
  1 5
  2
  1 2
EOS
OUTPUT3 = <<~"EOS"
  0
EOS

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, k: 回数
  n, s, k = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # k 回移動
  results = []
  paths = [[s]]
  while paths.length > 0
    path = paths.shift
    # k 回移動したら経路を記録
    if path.length == k + 1
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
