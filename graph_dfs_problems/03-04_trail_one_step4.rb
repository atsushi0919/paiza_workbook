# トレイルの経由地 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step4

INPUT1 = <<~"EOS"
  5 1 4 5
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
  1 5 2 3 5 4
EOS

INPUT2 = <<~"EOS"
  4 3 4 1
  1
  2
  3
  1 3 4
  2
  2 4
  2
  2 3
EOS
OUTPUT2 = <<~"EOS"
  -1
EOS

INPUT3 = <<~"EOS"
  6 5 6 3
  5
  2 3 4 5 6
  5
  1 3 4 5 6
  5
  1 2 4 5 6
  5
  1 2 3 5 6
  5
  1 2 3 4 6
  5
  1 2 3 4 5
EOS
OUTPUT3 = <<~"EOS"
  5 6 4 5 3 4 2 5 1 3 6
EOS

Walk = Struct.new(:history, :adjacent_list)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点, q: 中継点
  n, s, t, q = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = []
  input_lines.each_with_index do |line, idx|
    next if idx.even?
    adjacent_list << line.split.map(&:to_i)
  end

  # s から t までの経路を調べる
  results = { q_count: 0, history: [] }
  walks = [Walk.new([s], Marshal.load(Marshal.dump(adjacent_list)))]
  while walks.length > 0
    current_walk = walks.pop
    # t に着いたら結果を記録
    if current_walk.history.last == t
      q_count = current_walk.history.count(q)
      if q_count > results[:q_count]
        results[:q_count] = q_count
        results[:history] = [current_walk.history]
      elsif q_count == results[:q_count] && q_count > 0
        results[:history] << current_walk.history
      end
    end
    # 隣接頂点を調べる
    current_walk.adjacent_list[current_walk.history.last - 1].each do |next_node|
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
  # q を一番多く通過した経路または -1 を出力
  results[:q_count] > 0 ? results[:history].first.join(" ") : -1
end

puts main(STDIN.read)

