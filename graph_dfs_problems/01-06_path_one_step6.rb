# パスの通れない頂点 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step6

INPUT1 = <<~"EOS"
  5 1 4
  3
  2 3 5
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
  -1
EOS

INPUT2 = <<~"EOS"
  5 5 3
  3
  1 2 4
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
  5 3
EOS

INPUT3 = <<~"EOS"
  8 1 5
  2
  3 7
  3
  2 3 7
  4
  1 3 7 8
  7
  1 2 4 5 6 7 8
  4
  3 6 7 8
  3
  3 6 7
  4
  3 4 5 7
  7
  1 2 3 4 5 6 8
  4
  2 3 4 7
EOS
OUTPUT3 = <<~"EOS"
  1 2 8 4 6 5
EOS

def dfs(adjacent_list, history, t, non_visits = [])
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
      next if non_visits.include?(next_node)
      walks << current_walk + [next_node]
    end
  end
  results
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 通らないノード
  non_visits = input_lines.shift(2).last.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = []
  input_lines.each_with_index do |line, idx|
    next if idx.even?
    adjacent_list << line.split.map(&:to_i)
  end

  # 始点 s から終点 t までの経路
  results = dfs(adjacent_list, [s], t, non_visits)

  # 頂点が最も少ない経路または -1 を出力
  if results.length > 0
    results.sort { |a, b| a.length <=> b.length }.first.join(" ")
  else
    -1
  end
end

puts main(STDIN.read)
