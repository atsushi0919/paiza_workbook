# 乗り間違い (paizaランク B 相当)
# https://paiza.jp/works/mondai/bfs_dfs_problems_advanced/bfs_dfs_problems_advanced__wrong_train

INPUT1 = <<"EOS"
4 1 4
1 2
1 3
3 4
EOS

OUTPUT1 = <<"EOS"
20
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

# 入力
input_lines = $stdin.read.split("\n")
n, x, y = input_lines.shift.split.map(&:to_i)
s_t = input_lines.shift(n).map { |e| e.split.map(&:to_i) }

# 隣接リスト
ad_list = Array.new(n) { [] }
s_t.each do |s, t|
  ad_list[s - 1] <<= t - 1
  ad_list[t - 1] <<= s - 1
end

# x 駅からスタート
num_of_transit = Array.new(n, nil)          # 到着まで経由する駅の数
search_list = PriorityQueue.new([[x - 1]])  # 探索リスト
# BFS
while search_list.size > 0
  # 現在の状態を取り出す
  route = search_list.extract
  # 探索済み確認
  num_of_transit[route.last].nil? ? num_of_transit[route.last] = route.length : next
  # y 駅に着いたら経由駅数を記録してループ終了
  break if !num_of_transit[y - 1].nil?
  # 未探索の隣接駅を追加
  ad_list[route.last].each { |ns| search_list.insert(route + [ns]) unless num_of_transit[ns] }
end

# 出力
travel_time = 5 * (num_of_transit[y - 1] - 1)   # 最短時間
travel_time += 10 if ad_list[x - 1].length > 1  # 間違えた移動時間
puts travel_time

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
paiza 国には 1 から n までの番号がついた n 個の駅と、それらを結ぶ n - 1 本の路線があります。
i 番目の路線は、駅 a_i と駅 b_i を結んでいて、その所要時間は 5 分です。
これらの路線は木構造をなしています。

paiza 君は、最初に電車に乗るとき、2 つ以上の路線がある場合はいつも電車を乗り間違え、目的地への路線とは別の方向の路線に乗車して出発してしまいます。
そして、毎回次の駅で乗り間違えたことに気が付きます。
そのため、出発する駅に 2 つ以上の路線がある場合、目的地までの所要時間は、本来の所要時間に加えて 1 区間分往復する時間 (10 分) がかかります。

paiza 君が駅 x から駅 y に行くときにかかる時間を分単位で求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n x y
a_1 b_1
...
a_{n - 1} b_{n - 1}

・ 1 行目に、駅の個数を表す整数 n, 出発する駅・目的駅を表す整数 x, y が半角スペース区切りで与えられます。
・ 続く n - 1 行では、駅の番号の組 a_i, b_i が半角スペース区切りで与えられます。(1 ≦ i ≦ n - 1)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
答えの整数を 1 行に出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ n ≦ 100,000 = 10^5
・ 1 ≦ x, y ≦ n
・ x ≠ y
・ 1 ≦ a_i, b_i ≦ n
・ a_i ≠ b_i
・ (a_i, b_i) ≠ (a_j, b_j), (a_i, b_i) ≠ (b_j, a_j) (i ≠ j)
・ 与えられるグラフは木である

入力例1
4 1 4
1 2
1 3
3 4

出力例1
20
=end
