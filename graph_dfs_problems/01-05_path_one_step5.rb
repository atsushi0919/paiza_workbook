# パスの経由地 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step5

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
  1 2 3 4
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
  -1
EOS

def dfs(s, t, q, ad_list)
  results = []
  paths = [[s]]
  while paths.length > 0
    path = paths.pop

    # q を経由して t に着いたら経路を記録
    if path.last == t && path.include?(q)
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
  results
end

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

  # q を経由して s から t へ行ける経路
  results = dfs(s, t, q, ad_list)

  # 頂点が最も少ない経路、または -1 を出力
  if results.length > 0
    # 経路の頂点数で昇順ソート
    results.sort { |a, b| a.length <=> b.length }
    # 最も頂点数が少ない経路を出力
    results.first.join(" ")
  else
    # 該当経路なしなら -1 を出力
    -1
  end
end

p main(INPUT1)
# > 1 5 3 4
p main(INPUT2)
# > 5 1 2 3
p main(INPUT3)
# > -1
