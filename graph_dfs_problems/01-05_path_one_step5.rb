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

def dfs(adjacent_list, history, t)
  # history の末尾 から t への経路を調べる
  results = []
  walks = [history]
  while walks.length > 0
    current_walk = walks.pop
    if current_walk.last == t
      results << current_walk
      next
    end

    # 未訪問の隣接頂点に移動する
    adjacent_list[current_walk.last - 1].each do |next_node|
      next if current_walk.include?(next_node)
      walks << current_walk + [next_node]
    end
  end
  results
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点, p: 中継点
  n, s, t, p = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = []
  input_lines.each_with_index do |line, idx|
    next if idx.even?
    adjacent_list << line.split.map(&:to_i)
  end

  # 始点 s から中継点 p までの経路
  s_to_p = dfs(adjacent_list, [s], p)
  # 中継点 p から終点 t までの経路
  results = []
  s_to_p.each do |walk|
    tmp = dfs(adjacent_list, walk, t)
    results.concat(tmp) if tmp.length > 0
  end

  # 頂点が最も少ない経路、または -1 を出力
  if results.length > 0
    results.sort { |a, b| a.length <=> b.length }.first.join(" ")
  else
    -1
  end
end

puts main(STDIN.read)
