# 閉路の出力 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__cycle_step1

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
  2 1 3 2
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

def cycle_path(s, ad_list)
  paths = [[s]]
  while paths.length > 0
    path = paths.pop

    # 閉路なら path を返す
    if path.length > 3 && path.first == path.last
      return path
    end

    # 隣接頂点を調べる
    cn = path.last
    ad_list[cn].each do |nn|
      # 頂点数 3 個未満
      next if nn == s && path.length < 3
      # s 以外の頂点
      next if path[1..].include?(nn)
      # path を複製して情報更新
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

  # 閉路の経路
  path = cycle_path(s, ad_list)

  # 経路を出力
  path.empty? ? -1 : path.join(" ")
end

puts main(STDIN.read)
