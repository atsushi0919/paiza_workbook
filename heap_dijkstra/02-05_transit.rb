# 立ち寄り (paizaランク A 相当)
# https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__transit

INPUT1 = <<"EOS"
7 11 1 4 7
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
8
1 2 5 4 7
EOS

INPUT2 = <<"EOS"
8 7 2 7 1
2 3 8
1 8 4
1 3 7
1 7 4
1 4 6
1 6 4
1 5 5
EOS
OUTPUT2 = <<"EOS"
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

def dijkstra(s, t, ad_matrix)
  searched = Array.new(ad_matrix.length, INF)
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
    # 頂点が t ならコストと経路を返す
    if cv == t
      return { cost: cc, route: route }
    end

    # 隣接頂点を調べる (次のコスト, 頂点番号)
    ad_matrix[cv].each_with_index do |nc, nv|
      # 到達出来ない or 探索済みならスキップ
      next if nc == INF || searched[nv] < INF
      search_list.push([cc + nc, route + [nv]])
    end
  end
  # s -> t へ到達できない
  false
end

# 十分大きな値を cost 初期値に設定 (1 ≦ c_i ≦ 10)
INF = 99
# 入力
input_lines = $stdin.read.split("\n")
n, m, s, t, g = input_lines.shift.split.map(&:to_i)
abc = input_lines.shift(m).map { |r| r.split.map(&:to_i) }

# 隣接行列 (頂点番号を index に合わせる)
s -= 1
t -= 1
g -= 1
ad_matrix = Array.new(n) { Array.new(n, INF) }
abc.each { |a, b, c| ad_matrix[a - 1][b - 1] = c }

# s -> t, t -> g の最短経路を求め、その結果から
# s -> g の最短経路を求める (到達できないなら false)
s_to_t = dijkstra(s, t, ad_matrix)
t_to_g = dijkstra(t, g, ad_matrix)
s_to_g = s_to_t && t_to_g ? {
  cost: s_to_t[:cost] + t_to_g[:cost],
  route: s_to_t[:route] + t_to_g[:route][1..],
} : false

# 出力 (元の頂点番号に戻す)
puts s_to_g ? [s_to_g[:cost], s_to_g[:route].map { |v| v + 1 }.join(" ")] : "inf"

=begin
今日は、paiza 君は塾の日で、paiza 君は地点 s にある家から地点 g にある塾へ向かいます。
しかし、paiza 君はノートを使い切ってしまったため、塾へ行く前に地点 t にある文房具屋さんでノートを買う必要があります。
paiza 君が家を出発して、文房具屋さんでノートを買い、塾へたどり着くまでの最短時間とその経路を出力してください。
ただし、ノートを買う時間は考慮しないものとします。最短時間の経路が複数存在する場合は、そのうちのひとつを出力してください。
家から文房具屋さんまでの道、または文房具屋さんから塾までの道が存在しない場合は、inf と出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N M s t g
a_1 b_1 c_1
...
a_M b_M c_M

1 行目に、地点の個数を表す N と、それぞれの地点をつなぐ道の本数を表す整数 M と、地点の番号を表す整数 s, t, g が与えられます。

i + 1 行目に道 i を表す整数の組 (a_i,b_i,c_i) が与えられます。道 i は、地点 a_i から地点 b_i に向かう道で、その道の移動にかかる時間は c_i です。(1 ≦ i ≦ M)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
合計一行または二行出力してください。一行目に家から文房具屋さんを寄って塾へ到達するまでの最短時間を出力し、二行目にはその経路で辿る地点を順番に左から半角スペース区切りで出力してください。最短時間の経路が複数存在する場合はそのうちのひとつを出力してください。家から文房具屋さんまでの道、または文房具屋さんから塾までの道が存在しない場合は、一行で inf と出力してください。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


入力はすべて整数

3 ≦ N ≦ 100

1 ≦ M ≦ N × (N-1)

1 ≦ s,t,g ≦ N

s ≠ t ≠ g

1 ≦ a_i, b_i ≦ N (1 ≦ i ≦ M)

a_i ≠ b_i (1 ≦ i ≦ M)

1 ≦ c_i ≦ 10 (1 ≦ i ≦ M)

同じ頂点の組（順序組）は 2 回以上入力されない
入力例1
7 11 1 4 7
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
8
1 2 5 4 7

入力例2
8 7 2 7 1
2 3 8
1 8 4
1 3 7
1 7 4
1 4 6
1 6 4
1 5 5

出力例2
inf
=end
