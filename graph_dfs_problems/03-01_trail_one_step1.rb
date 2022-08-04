# グラフのトレイル (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step1

INPUT1 = <<~"EOS"
  3 1 2
EOS
OUTPUT1 = <<~"EOS"
  1 2 3
EOS

INPUT2 = <<~"EOS"
  5 1 5
EOS
OUTPUT2 = <<~"EOS"
  1 5 3 4 5 2
EOS

INPUT3 = <<~"EOS"
  14 3 9
EOS

Walk = Struct.new(:history, :adjacent_list)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, k: 回数
  n, s, k = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = Array.new(n) { [] }
  0.upto(n - 1) do |i|
    0.upto(n - 1) do |j|
      adjacent_list[i] << j if i != j
    end
  end

  # k 回移動
  walks = [Walk.new([s], Marshal.load(Marshal.dump(adjacent_list)))]
  while walks.length > 0
    current_walk = walks.pop
    if current_walk.history.length == k + 1
      # k 回移動した経路を出力
      return current_walk.history.join(" ")
    end
    # 隣接頂点に移動する
    current_walk.adjacent_list[current_walk.history.last - 1].each do |next_node|
      # 現在の情報を複製
      new_walk = Marshal.load(Marshal.dump(current_walk))
      # 一度通った辺を削除
      new_walk.adjacent_list[new_walk.history.last - 1].delete(next_node)
      new_walk.adjacent_list[next_node].delete(new_walk.history.last - 1)
      new_walk.history << next_node + 1
      walks << new_walk
    end
  end
end

puts main(STDIN.read)
