# 連結の判定 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__connect_step1

INPUT1 = <<~"EOS"
  3 1 2
  2
  2 3
  2
  1 3
  2
  1 2
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  5 1 5
  1
  2
  1
  1
  2
  4 5
  2
  3 5
  2
  3 4
EOS
OUTPUT2 = <<~"EOS"
  No
EOS

INPUT3 = <<~"EOS"
  10 1 10
  7
  2 3 4 5 6 7 8
  7
  1 3 4 5 6 7 8
  7
  1 2 4 5 6 7 8
  7
  1 2 3 5 6 7 8
  7
  1 2 3 4 6 7 8
  7
  1 2 3 4 5 7 8
  7
  1 2 3 4 5 6 8
  7
  1 2 3 4 5 6 7
  1
  10
  1
  9
EOS
OUTPUT3 = <<~"EOS"
  No
EOS

class UnionFind
  attr_reader :parents

  def initialize(n)
    @parents = Array.new(n, -1)
  end

  def root(x)
    return x if @parents[x] < 0
    @parents[x] = root(@parents[x])
  end

  def same?(x, y)
    root(x) == root(y)
  end

  def merge(x, y)
    x = root(x)
    y = root(y)
    return if x == y

    x, y = y, x if @parents[x] > @parents[y]
    @parents[x] += @parents[y]
    @parents[y] = x
  end

  def size(x)
    -@parents[root(x)]
  end
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)

  # UnionFind に新しい頂点を追加
  uf = UnionFind.new(n)
  input_lines.each_with_index do |line, idx|
    next if idx.even?
    x = idx / 2
    line.split.each do |y|
      y = y.to_i - 1
      uf.merge(x, y.to_i) if y > x
    end
  end

  # s と t は同じ連結か？
  uf.same?(s - 1, t - 1) ? "Yes" : "No"
end

puts main(STDIN.read)
