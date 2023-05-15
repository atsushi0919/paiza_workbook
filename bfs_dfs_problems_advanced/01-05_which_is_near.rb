# どっちが近い？ (paizaランク A 相当)
# https://paiza.jp/works/mondai/bfs_dfs_problems_advanced/bfs_dfs_problems_advanced__which_is_near

INPUT1 = <<"EOS"
3 2 1 3
1 2
2 3
EOS
OUTPUT1 = <<"EOS"
X is closer
Same
Y is closer
EOS

class PriorityQueue
  attr_reader :data

  def initialize(array = [])
    @data = []
    array.each { |e| insert(e) }
  end

  def insert(e)
    @data << e
    up_heap
  end

  def extract
    target_e = @data.shift
    if size > 1
      @data.unshift @data.pop
      down_heap
    end
    target_e
  end

  def size
    @data.size
  end

  private

  def swap(a, b)
    @data[a], @data[b] = @data[b], @data[a]
  end

  def parent_idx(idx)
    idx / 2 + idx % 2 - 1
  end

  def l_child_idx(idx)
    (idx * 2) + 1
  end

  def r_child_idx(idx)
    (idx * 2) + 2
  end

  def has_child?(idx)
    ((idx * 2) + 1) < @data.size
  end

  def up_heap
    idx = size - 1
    return if idx == 0
    parent_idx = parent_idx(idx)
    while @data[parent_idx].length > @data[idx].length
      swap(parent_idx, idx)
      return if parent_idx == 0
      idx = parent_idx
      parent_idx = parent_idx(idx)
    end
  end

  def down_heap
    idx = 0
    while (has_child?(idx))
      l_idx = l_child_idx(idx)
      r_idx = r_child_idx(idx)
      if @data[r_idx].nil?
        target_idx = l_idx
      else
        target_idx = @data[l_idx].length <= @data[r_idx].length ? l_idx : r_idx
      end
      if @data[idx].length > @data[target_idx].length
        swap(idx, target_idx)
        idx = target_idx
      else
        return
      end
    end
  end
end

# s 地点から各地点の最短経路を調べる
def shortest_route(n, s, ad_list)
  shortest_route = Array.new(n, nil)
  search_list = PriorityQueue.new([[s]])

  while search_list.size > 0
    # 現在位置を調べる
    route = search_list.extract
    cp = route.last
    # 探索済み確認
    shortest_route[cp].nil? ? shortest_route[cp] = route.length - 1 : next

    # 隣接地点が未探索なら探索リストに追加
    ad_list[cp].each { |np| shortest_route[np].nil? ? search_list.insert(route + [np]) : next }
  end
  # 最短経路を返す
  shortest_route
end

# 入力
input_lines = $stdin.read.split("\n")
n, m, x, y = input_lines.shift.split.map(&:to_i)
a_b = input_lines.shift(m).map { |e| e.split.map(&:to_i) }

# 隣接リスト（地点番号は添え字に合わせる）
ad_list = Array.new(n) { [] }
a_b.each do |a, b|
  ad_list[a - 1] <<= b - 1
  ad_list[b - 1] <<= a - 1
end

# x, y 地点から各地点の距離を調べる
x_route = shortest_route(n, x - 1, ad_list)
y_route = shortest_route(n, y - 1, ad_list)

# 出力
puts x_route.zip(y_route).map { |x_dist, y_dist|
  if x_dist < y_dist
    "X is closer"
  elsif x_dist > y_dist
    "Y is closer"
  else
    "Same"
  end
}.join("\n")

=begin
paiza 国には 1 から n までの番号がついた n 個の地点と、それらを結ぶ m 本の道路があります。
i 番目の道路は、地点 a_i と地点 b_i を結んでいて、その距離は 5 km です。

今回、paiza 国では 2 つの避難場所をつくることにしました。
避難場所はそれぞれ地点 x, y にあります。

各地点について、地点 x までの最短距離と、地点 y までの最短距離のどちらが短いかを求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n m x y
a_1 b_1
...
a_m b_m

・ 1 行目に、地点の個数を表す整数 n, 道路の本数を表す整数 m, 避難場所の地点を表す整数 x, y が半角スペース区切りで与えられます。
・ 続く m 行では、地点の番号の組 a_i, b_i が半角スペース区切りで与えられます。(1 ≦ i ≦ m)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
合計 n 行出力してください。

i 行目には、地点 i から地点 x までの最短距離のほうが短い場合には X is closer, 地点 i から地点 y までの最短距離のほうが短い場合には Y is closer, どちらも同じ場合には Same を出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ n ≦ 100,000 = 10^5
・ n - 1 ≦ m ≦ min(n × (n - 1) / 2, 100,000 = 10^5)
・ 1 ≦ x, y ≦ n
・ x ≠ y
・ 1 ≦ a_i, b_i ≦ n
・ a_i ≠ b_i
・ (a_i, b_i) ≠ (a_j, b_j), (a_i, b_i) ≠ (b_j, a_j) (i ≠ j)
・ 与えられるグラフは連結である

入力例1
3 2 1 3
1 2
2 3

出力例1
X is closer
Same
Y is closer
=end
