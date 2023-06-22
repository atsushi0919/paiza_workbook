# 木上の最短経路 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dag_memoization_search/dag_memoization__problems_step6

INPUT1 = <<"EOS"
6
1 2 3
1 3 1
2 4 2
2 5 1
3 6 1
EOS
OUTPUT1 = <<"EOS"
0
3
1
5
4
2
EOS

# 入力
input_lines = INPUT1.split("\n")
n = input_lines.shift.to_i
std = input_lines.shift(n - 1).map { |r| r.split.map(&:to_i) }

# 隣接行列 (ノード番号をindexに合わせる)
ad_matrix = Array.new (n) { Array.new(n) }
std.each { |s, t, d| ad_matrix[s - 1][t - 1] = d }
# ノード 1 から探索
searched = Array.new(n)
search_list = [{ id: 0, cost: 0 }]
while search_list.length > 0
  node = search_list.shift

  # 最短距離を確定
  searched[node[:id]] = node[:cost]
  # 隣接ノードを調べる
  ad_matrix[node[:id]].each_with_index do |nc, ni|
    # 非連結、探索済みならスキップ
    next if nc.nil? || searched[ni]
    # 次のノードを探索リストに追加
    search_list << { id: ni, cost: node[:cost] + nc }
  end
end

# ノード1 から各ノードまでの最短距離を出力
puts searched.join("\n")
=end


=begin
N 頂点からなる木が与えられます。 N - 1 個の辺について、 i 番目の辺は頂点 S_i と頂点 T_i をつないでおり、その距離は D_i です。
あなたは現在、木の根である頂点 1 にいます。

ノード 1 から各ノードへの最短距離をそれぞれ求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
N
S_1 T_1 D_1
S_2 T_2 D_2
...
S_{N-1} T_{N-1} D_{N-1}


・ 1 行目に、木の頂点の数が与えられます。
・ 2 行目から N 行目にかけて、辺が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i 行目の出力では頂点 1 から頂点 i への最短距離を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ N ≦ 100,000
・ 1 ≦ S_i, T_i ≦ N
・ 1 ≦ D_i ≦ 100,000

入力例1
6
1 2 3
1 3 1
2 4 2
2 5 1
3 6 1

出力例1
0
3
1
5
4
2
=end
