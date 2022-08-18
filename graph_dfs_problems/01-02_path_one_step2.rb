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
  ad_list = Hash.new { [] }
  1.upto(n) do |i|
    1.upto(n) do |j|
      ad_list[i] <<= j if i != j
    end
  end

  # 起点 s から k 回移動する経路
  walk = [s]
  k.times do
    # 今いる頂点
    cv = walk.last
    # 移動可能な頂点を選択して walk 末尾へ追加
    walk << ad_list[cv].last
  end
  # 経路を出力
  walk.join(" ")
end

puts main(STDIN.read)
# > 1 3 2
puts main(INPUT2)
# > 5 4 5 4
