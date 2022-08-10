# グラフの s,t パス (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step4

INPUT1 = <<~"EOS"
  5 1 4
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
  1 5 4
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
  5 3
EOS

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = []
  input_lines.each_with_index do |line, idx|
    next if idx.even?
    adjacent_list << line.split.map(&:to_i)
  end

  # s から t への経路を調べる
  results = []
  walks = [[s]]
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
  results.sort { |a, b| a.length <=> b.length }.first.join(" ")
end

puts main(STDIN.read)
