# 高速道路 (paizaランク B 相当)
# https://paiza.jp/works/mondai/bfs_dfs_problems_advanced/bfs_dfs_problems_advanced__highway

INPUT1 = <<"EOS"
5 4
0 3 10 12 9
1 2
2 3
2 4
2 5
EOS
OUTPUT1 = <<"EOS"
1
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

# 高速道路の区間所要時間
TIME = 5
# 入力
input_lines = $stdin.read.split("\n")
n, m = input_lines.shift.split.map(&:to_i)
t = input_lines.shift.split.map(&:to_i)
a_b = input_lines.shift(m).map { |e| e.split.map(&:to_i) }

# 隣接リスト（地点番号は添え字に合わせる）
ad_list = Array.new(n) { [] }
a_b.each do |a, b|
  ad_list[a - 1] <<= b - 1
  ad_list[b - 1] <<= a - 1
end

# 0 地点からスタート
highway_times = Array.new(n, nil)       # 高速使用時の所要時間
search_list = PriorityQueue.new([[0]])  # 探索リスト
# BFS（高速道路での各地点までの所要時間を計算する）
while search_list.size > 0
  # 現在の状態を取り出す
  route = search_list.extract
  # 探索済み確認
  highway_times[route.last].nil? ? highway_times[route.last] = TIME * (route.length - 1) : next
  # 未探索の隣接 JCT を追加
  ad_list[route.last].each { |nj| search_list.insert(route + [nj]) if highway_times[nj].nil? }
end

# 高速道路を使った方が早い地点をカウントして出力
puts t.zip(highway_times).count { |nt, ht| nt > ht }

=begin
paiza 国では新たに高速道路を建設することになりました。

1 から n までの番号が付けられた n 個の地点と、それらを結ぶ m 本の高速道路が与えられます。
高速道路の各道路は、地点 a_i と地点 b_i を結んでおり、その所要時間は 5 分です。

現在、一般道路のみを使用した場合の地点 1 から地点 j までの最短所要時間は t_j 分です。
高速道路のみを使用することで、地点 1 からの最短所要時間が短くなるような地点の個数を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n m
t_1 t_2 ... t_n
a_1 b_1
...
a_m b_m

・ 1 行目に、地点の個数を表す整数 n, 道路の本数を表す整数 m が半角スペース区切りで与えられます。
・ 2 行目に、一般道路での地点 1 から地点 j までの最短所要時間 t_j が半角スペース区切りで与えられます。(1 ≦ i ≦ n)
・ 続く m 行では、地点の番号の組 a_i, b_i が半角スペース区切りで与えられます。(1 ≦ i ≦ m)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
答えの整数を 1 行に出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ n ≦ 100,000 = 10^5
・ n - 1 ≦ m ≦ min(n × (n - 1) / 2, 100,000 = 10^5)
・ 0 ≦ t_i ≦ 500,000 = 5 × 10^5
・ t_1 = 0
・ 1 ≦ a_i, b_i ≦ n
・ a_i ≠ b_i
・ (a_i, b_i) ≠ (a_j, b_j), (a_i, b_i) ≠ (b_j, a_j) (i ≠ j)
・ 与えられるグラフは連結である

入力例1
5 4
0 3 10 12 9
1 2
2 3
2 4
2 5

出力例1
1
=end
