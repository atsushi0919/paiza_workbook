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
  ad_list = Hash.new { [] }
  1.upto(n) do |i|
    1.upto(n) do |j|
      ad_list[i] <<= j if i != j
    end
  end

  # s から k 回移動する経路
  path = [s]
  k.times do
    # 今いる頂点
    cv = path.last
    # 移動可能な未訪問の頂点を末尾に追加する
    ad_list[cv].reverse.each do |nv|
      # 訪問済の頂点はスキップ
      next if path.include?(nv)
      path << nv
      break
    end
  end
  path.join(" ")
end

puts main(INPUT1)
# > 1 3 2
puts main(INPUT2)
# > 5 4 3 2
