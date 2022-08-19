# 隣接頂点の出力 2 (paizaランク D 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step1

INPUT1 = <<~"EOS"
  3 2
  1
  2
  2
  1 3
  1
  2
EOS
OUTPUT1 = <<~"EOS"
  1 3
EOS

INPUT2 = <<~"EOS"
  5 5
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
  1 2 3 4
EOS

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 探索対象の頂点
  n, s = input_lines.shift.split.map(&:to_i)
  edges = input_lines.each_slice(2).map do |lines|
    lines.last.split.map(&:to_i).sort
  end

  # s の隣接頂点を全て表示
  if edges[s - 1].length > 0
    edges[s - 1].join(" ")
  else
    -1
  end
end

puts main(STDIN.read)
