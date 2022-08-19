# グラフのウォーク 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step2

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
  25
  2 1 2 1 2
  2 1 2 3 2
  2 1 2 3 4
  2 1 2 4 2
  2 1 2 4 3
  2 3 2 1 2
  2 3 2 3 2
  2 3 2 3 4
  2 3 2 4 2
  2 3 2 4 3
  2 3 4 2 1
  2 3 4 2 3
  2 3 4 2 4
  2 3 4 3 2
  2 3 4 3 4
  2 4 2 1 2
  2 4 2 3 2
  2 4 2 3 4
  2 4 2 4 2
  2 4 2 4 3
  2 4 3 2 1
  2 4 3 2 3
  2 4 3 2 4
  2 4 3 4 2
  2 4 3 4 3
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
  32
  5 1 2 1
  5 1 2 3
  5 1 2 5
  5 1 5 1
  5 1 5 2
  5 1 5 3
  5 1 5 4
  5 2 1 2
  5 2 1 5
  5 2 3 2
  5 2 3 4
  5 2 3 5
  5 2 5 1
  5 2 5 2
  5 2 5 3
  5 2 5 4
  5 3 2 1
  5 3 2 3
  5 3 2 5
  5 3 4 3
  5 3 4 5
  5 3 5 1
  5 3 5 2
  5 3 5 3
  5 3 5 4
  5 4 3 2
  5 4 3 4
  5 4 3 5
  5 4 5 1
  5 4 5 2
  5 4 5 3
  5 4 5 4
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
  walks = [[s]]
  while walks.length > 0
    walk = walks.pop
    # k 回移動したら経路を記録
    if walk.length == k + 1
      results << walk
      next
    end

    # 隣接頂点に移動する
    cv = walk.last
    ad_list[cv].each do |nv|
      walks << walk + [nv]
    end
  end

  # 経路数と経路を全て出力
  [results.length.to_s].concat(results.map { |e| e.join(" ") }).join("\n")
end

puts main(STDIN.read)
