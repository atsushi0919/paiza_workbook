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
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # 頂点 s の隣接頂点を番号順に半角スペース区切りで出力
  ad_list[s].join(" ")
end

puts main(STDIN.read)
