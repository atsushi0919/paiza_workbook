# グラフの s,t トレイル (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step2

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
  1 5 3 2 5 4
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
  5 1 2 3
EOS

INPUT3 = <<~"EOS"
  7 6 4
  6
  2 3 4 5 6 7
  6
  1 3 4 5 6 7
  6
  1 2 4 5 6 7
  6
  1 2 3 5 6 7
  6
  1 2 3 4 6 7
  6
  1 2 3 4 5 7
  6
  1 2 3 4 5 6
EOS
OUTPUT3 = <<~"EOS"
  6 3 2 5 1 7 2 1 3 5 7 3 4
EOS

Walk = Struct.new(:history, :adjacent_list)

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
  walks = [Walk.new([s], Marshal.load(Marshal.dump(adjacent_list)))]
  while walks.length > 0
    current_walk = walks.pop
    if current_walk.history.last == t
      results << current_walk.history
      next
    end
    # 隣接頂点を調べる
    current_walk.adjacent_list[current_walk.history.last - 1].each do |next_node|
      # s は再訪問しない
      next if next_node == s
      # 現在の情報を複製
      new_walk = Marshal.load(Marshal.dump(current_walk))
      # 一度通った辺を削除
      new_walk.adjacent_list[new_walk.history.last - 1].delete(next_node)
      new_walk.adjacent_list[next_node - 1].delete(new_walk.history.last)
      new_walk.history << next_node
      # 新しい経路を追加
      walks << new_walk
    end
  end
  # 頂点数が一番多い経路から 1 つを出力
  results.sort { |a, b| a.length <=> b.length }.last.join(" ")
end

puts main(STDIN.read)
