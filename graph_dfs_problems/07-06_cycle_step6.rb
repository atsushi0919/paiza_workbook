# 通れない頂点が存在する閉路の総数 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__cycle_step6

INPUT1 = <<~"EOS"
  4 2
  1
  4
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
  1
EOS

INPUT2 = <<~"EOS"
  5 5
  3
  1 3 4
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
  0
EOS

def cycle_count(s, ad_list, unused_nodes)
  count = 0
  paths = [[s]]
  while paths.length > 0
    path = paths.pop

    # 閉路を記録する
    if path[..-2].include?(path.last)
      cycle_path = path[path[..-2].index(path.last)..]
      if cycle_path.length > 3
        count += 1
      end
      next
    end

    # 隣接頂点を調べる
    cn = path.last
    ad_list[cn].each do |nn|
      # 不使用頂点確認
      next if unused_nodes.include?(nn)
      paths << path + [nn]
    end
  end
  count / 2
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, t: 始点
  n, t = input_lines.shift.split.map(&:to_i)
  # 通らない頂点
  unused_nodes = input_lines.shift(2).last.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # 閉路の経路数を出力
  cycle_count(t, ad_list, unused_nodes)
end

puts main(STDIN.read)
