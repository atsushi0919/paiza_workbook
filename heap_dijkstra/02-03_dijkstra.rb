# ダイクストラ法の実装 (paizaランク A 相当)
# https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__dijkstra

INPUT1 = <<"EOS"
7 11 1
1 2 2
1 3 4
2 3 1
2 4 8
2 5 1
3 5 4
3 6 3
4 7 2
5 4 3
5 7 1
6 7 3
EOS
OUTPUT1 = <<"EOS"
2
3
5
7
4
6
0
2
3
6
3
6
4
EOS

INPUT2 = <<"EOS"
8 7 2
2 3 8
1 8 4
1 3 7
1 7 4
1 4 6
1 6 4
1 5 5
EOS
OUTPUT2 = <<"EOS"
3
inf
0
8
inf
inf
inf
inf
inf
EOS

class PryorityQueue
  attr_reader :data

  def initialize(array = [], key = 0)
    @data = array
    @key = key
  end

  def push(element)
    @data << element
    up_heap
  end

  def pop
    target_element = @data.shift
    if size > 1
      @data.unshift @data.pop
      down_heap
    end
    target_element
  end

  def size
    @data.length
  end

  def parent_idx(idx)
    idx / 2 + idx % 2 - 1
  end

  def swap(a, b)
    @data[a], @data[b] = @data[b], @data[a]
  end

  def left_child_idx(idx)
    (idx * 2) + 1
  end

  def right_child_idx(idx)
    (idx * 2) + 2
  end

  def has_child?(idx)
    ((idx * 2) + 1) < @data.size
  end

  def up_heap
    idx = size - 1
    return if idx == 0

    parent_idx = parent_idx(idx)
    while @data[parent_idx][@key] > @data[idx][@key]
      swap(parent_idx, idx)
      return if parent_idx == 0
      idx = parent_idx
      parent_idx = parent_idx(idx)
    end
  end

  def down_heap
    idx = 0
    while (has_child?(idx))
      l_idx = left_child_idx(idx)
      r_idx = right_child_idx(idx)
      if @data[r_idx].nil?
        target_idx = l_idx
      else
        target_idx = @data[l_idx][@key] <= @data[r_idx][@key] ? l_idx : r_idx
      end
      if @data[idx][@key] > @data[target_idx][@key]
        swap(idx, target_idx)
        idx = target_idx
      else
        return
      end
    end
  end
end

# 十分大きな値を cost 初期値に設定 (1 ≦ c_i ≦ 10)
INF = 99
# 入力
input_lines = INPUT1.split("\n")
n, m, s = input_lines.shift.split.map(&:to_i)
abc = input_lines.shift(m).map { |r| r.split.map(&:to_i) }

# 隣接行列 (頂点番号を index に合わせる)
s -= 1
ad_matrix = Array.new(n) { Array.new(n, INF) }
abc.each do |a, b, c|
  ad_matrix[a - 1][b - 1] = c
  ad_matrix[b - 1][a - 1] = c
end

# dijkstra
searched = Array.new(n, INF)
search_list = PryorityQueue.new [[0, [s]]]
while search_list.size > 0
  # 現在地までのコスト, 経路
  cc, route = search_list.pop
  # 現在の頂点
  cv = route.last
  # 探索済みならスキップ
  next if searched[cv] < INF
  # 最小コストで確定
  searched[cv] = cc

  # 隣接頂点を調べる (次のコスト, 頂点番号)
  ad_matrix[cv].each_with_index do |nc, nv|
    # 到達出来ない or 探索済みならスキップ
    next if nc == INF || searched[nv] < INF
    search_list.push([cc + nc, route + [nv]])
  end
end

p searched

=begin
1,...,N の番号のついた N 個の頂点とそれらをつなぐ枝からなる有向グラフを考えます。ただし、自己ループと多重辺は考えません。

M 本の有向枝と頂点番号 s が与えられます。ダイクストラ法を利用して、頂点 s からほかのすべての頂点へ向かう経路の最短距離を求めてください。
ダイクストラ法とは、

最短距離が未確定の頂点のうち、始点からの距離が最短な頂点の最短距離を確定する

ことを、始点から到達可能なすべての頂点の最短距離が確定するまで繰り返すアルゴリズムです。

頂点 s からある頂点への最短距離が確定した順番にその頂点を出力し、最後に各頂点への最短距離を出力してください。
ただし、ある頂点からその頂点自身へ移動する場合はその距離を 0、頂点 s からある頂点へ到達不可能な場合はその頂点への距離を inf としてください。

ただし、頂点 s から距離が同じ頂点が複数存在する場合は、そのなかで番号が最も小さい頂点を、頂点 s から最も距離が短い頂点とします。
また、距離とはその頂点までの経路（枝の集合）を構成する枝の重みの和とします。

ヒント

前問で頂点 s から 2 番目に最短距離が短い頂点までを求めたと思います。同様にして、3 番目、4 番目というように、
順番に頂点 s から最短距離が短い頂点を求めればよいです。
▼　下記解答欄にコードを記入してみよう

入力される値
N M s
a_1 b_1 c_1
...
a_M b_M c_M

1 行目に、頂点の個数を表す N と、枝の本数を表す整数 M と、頂点の番号を表す整数 s が与えられます。

i + 1 行目に枝 i を表す整数の組 (a_i,b_i,c_i) が与えられます。枝 i は、頂点 a_i から頂点 b_i に向かう枝で、
その重み（距離）は c_i です。(1 ≦ i ≦ M)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
頂点 s から到達可能な頂点（s を除く）の数を R として、合計 R + N 行出力してください。
r 行目に頂点 s からの最短距離が r 番目に短い頂点とその最短距離を左から半角スペース区切りで出力してください(1 ≦ r ≦ R)。
R + j 行目には頂点 s から頂点 j への最短距離を出力してください(1 ≦ j ≦ N)。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


入力はすべて整数

2 ≦ N ≦ 100

1 ≦ M ≦ N × (N-1)

1 ≦ s ≦ N

1 ≦ a_i, b_i ≦ N (1 ≦ i ≦ M)

a_i ≠ b_i (1 ≦ i ≦ M)

1 ≦ c_i ≦ 10 (1 ≦ i ≦ M)

同じ頂点の組（順序組）は 2 回以上入力されない
入力例1
7 11 1
1 2 2
1 3 4
2 3 1
2 4 8
2 5 1
3 5 4
3 6 3
4 7 2
5 4 3
5 7 1
6 7 3

出力例1
2
3
5
7
4
6
0
2
3
6
3
6
4

入力例2
8 7 2
2 3 8
1 8 4
1 3 7
1 7 4
1 4 6
1 6 4
1 5 5

出力例2
3
inf
0
8
inf
inf
inf
inf
inf
=end
