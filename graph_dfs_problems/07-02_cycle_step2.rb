# グラフの閉路の総数 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__cycle_step2

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
  6
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
  6
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
  0
EOS

def cycle_count(s, ad_list)
  cycle_count = 0
  paths = [[s]]
  while paths.length > 0
    path = paths.pop

    # 逆回りも含めた閉路をカウント
    if path.length > 3 && path.first == path.last
      cycle_count += 1
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
  cycle_count / 2
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

  # 閉路数を出力
  cycle_count(s, ad_list)
end

puts main(STDIN.read)
