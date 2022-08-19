# パスの通れない頂点 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step6

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
  6
  2 1 3 2 4 3
  2 1 3 4 2 3
  2 3 1 2 4 3
  2 3 4 2 1 3
  2 4 3 1 2 3
  2 4 3 2 1 3
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
  1
  5 3
EOS

INPUT3 = <<~"EOS"
  7 3 4
  1
  2
  6
  2 3 4 5 6 7
  3
  1 3 7
  3
  1 2 4
  3
  1 3 5
  3
  1 4 6
  3
  1 5 7
  3
  1 2 6
EOS
OUTPUT3 = <<~"EOS"
  5
  3 1 4
  3 1 5 4
  3 1 6 5 4
  3 1 7 6 5 4
  3 4
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

  # 経路数と経路を全て出力
  [results.length.to_s].concat(results.map { |e| e.join(" ") }).join("\n")
end

puts main(STDIN.read)
