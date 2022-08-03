# グラフのウォーク (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step2

INPUT1 = <<~"EOS"
  3 1 2
EOS
OUTPUT1 = <<~"EOS"
  1 2 1
EOS

INPUT2 = <<~"EOS"
  5 5 3
EOS

OUTPUT2 = <<~"EOS"
  5 4 3 4
EOS

def main(input_str)
  # n: 頂点数, s: 起点, k: 回数
  n, s, k = input_str.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = Array.new(n) { [] }
  0.upto(n - 1) do |i|
    0.upto(n - 1) do |j|
      adjacent_list[i] << j if i != j
    end
  end

  # k 回移動する経路
  walks = [s]
  k.times do
    # 今いる頂点に隣接している頂点のうち最も番号の大きいもの
    walks << adjacent_list[walks.last - 1].last + 1
  end
  walks.join(" ")
end

puts main(STDIN.read)
