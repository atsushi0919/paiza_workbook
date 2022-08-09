# ハミルトン閉路の出力 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__cycle_step7

INPUT1 = <<~"EOS"
  4 2
  3
  2 3 4
  3
  1 3 4
  3
  1 2 4
  3
  1 2 3
EOS
OUTPUT1 = <<~"EOS"
  2 1 3 4 2
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
  5 1 2 3 4 5
EOS

INPUT3 = <<~"EOS"
  6 1
  1
  2
  5
  1 3 4 5 6
  4
  2 4 5 6
  4
  2 3 5 6
  4
  2 3 4 6
  4
  2 3 4 5
EOS
OUTPUT3 = <<~"EOS"
  -1
EOS

def hamilton_path(s, ad_list)
  paths = [[s]]
  while paths.length > 0
    path = paths.pop

    # 閉路を記録する
    if path[..-2].include?(path.last)
      cycle_path = path[path[..-2].index(path.last)..]
      if cycle_path.length == ad_list.length + 1
        return cycle_path
      end
      next
    end

    # 隣接頂点を調べる
    cn = path.last
    ad_list[cn].each do |nn|
      paths << path + [nn]
    end
  end
  []
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 始点
  n, s = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # ハミルトン閉路の経路
  path = hamilton_path(s, ad_list)

  # 経路を出力
  path.empty? ? -1 : path.join(" ")
end

puts main(STDIN.read)
