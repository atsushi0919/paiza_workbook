# グラフのパス (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step3

INPUT1 = <<~"EOS"
  3 1 2
EOS
OUTPUT1 = <<~"EOS"
  1 2 3
EOS

INPUT2 = <<~"EOS"
  5 5 3
EOS
OUTPUT2 = <<~"EOS"
  5 4 3 2
EOS

def main(input_str)
  # n: 頂点数, s: 起点, k: 回数
  n, s, k = input_str.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = Array.new(n) { [] }
  0.upto(n - 1) do |i|
    # 大きい順に参照したいので降順にする
    (n - 1).downto(0) do |j|
      adjacent_list[i] << j if i != j
    end
  end

  # 訪問済み
  visited = Array.new(n, false)
  # k 回移動
  walks = [s]
  k.times do
    current_node = walks.last - 1
    visited[current_node] = true
    # 今いる頂点に隣接している頂点のうち、未訪問かつ最も番号の大きい頂点に移動する
    adjacent_list[current_node].each do |next_node|
      next if visited[next_node]
      visited[next_node] = true
      walks << next_node + 1
      break
    end
  end
  walks.join(" ")
end

puts main(STDIN.read)
