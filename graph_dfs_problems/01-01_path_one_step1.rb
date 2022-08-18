# 隣接頂点の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step1

INPUT1 = <<~"EOS"
  3 2
  1
  2
  2
  1 3
  1
  2
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  5 5
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
  4
EOS

=begin
# サンプルコード1
# n: 頂点数, s: 指定の頂点
n, s = gets.split.map(&:to_i)

# 頂点番号 i = 1 から n までの隣接リストを作成
ad_list = {}
1.upto(n) do |i|
  # 経路数（使わない）
  v = gets
  # 経路（頂点番号 i から行ける頂点）
  e = gets.split.map(&:to_i)

  # ad_list に追加する
  ad_list[i] = e
end

p ad_list

# INPUT1 の場合
# > {1=>[2], 2=>[1, 3], 3=>[2]}
# INPUT2 の場合
# > {1=>[2, 5], 2=>[1, 3, 5], 3=>[2, 4, 5], 4=>[3, 5], 5=>[1, 2, 3, 4]}
=end

=begin
# サンプルコード2
def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 指定の頂点
  n, s = input_lines.shift.split.map(&:to_i)

  # 頂点番号 i = 1 から n までの隣接リスト作成
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    # 経路数 v は使わない
    if i.even?
      # 隣接リストに経路を格納
      ad_list[i / 2] = line.split.map(&:to_i)
    end
  end

  # 確認用コード
  ad_list
end

puts main(INPUT1)
# > {1=>[2], 2=>[1, 3], 3=>[2]}
puts main(INPUT2)
# > {1=>[2, 5], 2=>[1, 3, 5], 3=>[2, 4, 5], 4=>[3, 5], 5=>[1, 2, 3, 4]}
=end

=begin
# サンプルコード3
def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 指定の頂点
  n, s = input_lines.shift.split.map(&:to_i)

  # 頂点番号 i = 1 から n までの隣接リスト作成
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    # 経路数 v は使わない
    if i.even?
      # 隣接リストに経路を格納
      ad_list[i / 2] = line.split.map(&:to_i)
    end
  end

  # 頂点 s に隣接している頂点の最大番号
  ad_list[s].last
end

puts main(INPUT1)
# > 3
puts main(INPUT2)
# > 4
=end

# 回答コード
def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 指定の頂点
  n, s = input_lines.shift.split.map(&:to_i)
  # 頂点番号 i = 1 から n までの隣接リスト作成
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    # 経路数 v は使わない
    if i.even?
      # 隣接リストに経路を格納
      ad_list[i / 2] = line.split.map(&:to_i)
    end
  end

  # 頂点 s に隣接している頂点の最大番号
  ad_list[s].last
end

puts main(STDIN.read)
