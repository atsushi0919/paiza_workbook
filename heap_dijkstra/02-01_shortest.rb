# 最も近い頂点 (paizaランク C 相当)
# https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__shortest

INPUT1 = <<"EOS"
5 5 1
1 2 4
1 3 9
2 4 1
4 5 3
5 2 3
EOS
OUTPUT1 = <<"EOS"
2
EOS

INPUT2 = <<"EOS"
8 7 1
1 2 8
1 8 4
1 3 7
1 7 4
1 4 6
1 6 4
1 5 5
EOS
OUTPUT2 = <<"EOS"
6
EOS

INPUT3 = <<"EOS"
8 7 2
1 2 8
1 8 4
1 3 7
1 7 4
1 4 6
1 6 4
1 5 5
EOS
OUTPUT3 = <<"EOS"
inf
EOS

# 十分大きな値を cost 初期値に設定 (1 ≦ c_i ≦ 10)
INF = 99
# 入力
input_lines = $stdin.read.split("\n")
n, m, s = input_lines.shift.split.map(&:to_i)
abc = input_lines.shift(m).map { |r| r.split.map(&:to_i) }

# 隣接行列 (頂点番号を index に合わせる)
s -= 1
ad_matrix = Array.new(n) { Array.new(n, INF) }
abc.each { |a, b, c| ad_matrix[a - 1][b - 1] = c }

# cost最小値の頂点番号を出力 (元の頂点番号に戻す)
min_cost = ad_matrix[s].min
puts min_cost < INF ? ad_matrix[s].index(min_cost) + 1 : "inf"

=begin
ここからは最短経路問題を解くアルゴリズムであるダイクストラ法を扱います。
最短経路問題とは、重み付きグラフの与えられた 2 点を結ぶ経路のうち、コスト（距離など）が最小のものを求める問題です。
ダイクストラ法を使うと、グラフのある頂点からそのほかの各頂点への最短距離を求めることができます。

まずは、ある頂点に最も近い頂点を求めてみましょう。これは二分ヒープを用いて求めることができます。

1,...,N の番号のついた N 個の頂点とそれらをつなぐ枝からなる有向グラフを考えます。ただし、自己ループと多重辺は考えません。

M 本の有向枝と頂点番号 s が与えられます。頂点 s に隣接している頂点のなかで、s からの距離が最も短い頂点を出力してください。

ただし、頂点 s から距離が同じ頂点が複数存在する場合は、そのなかで番号が最も小さい頂点を、頂点 s から最も距離が短い頂点とします。
また、距離とはその頂点までの経路（枝の集合）を構成する枝の重みの和とします。

s に隣接している頂点が存在しない場合は、inf と出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N M s
a_1 b_1 c_1
...
a_M b_M c_M

1 行目に、頂点の個数を表す N と、枝の本数を表す整数 M と、頂点の番号を表す整数 s が与えられます。

i + 1 行目に枝 i を表す整数の組 (a_i,b_i,c_i) が与えられます。枝 i は、頂点 a_i から頂点 b_i に向かう枝で、その重み（距離）は c_i です。(1 ≦ i ≦ M)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
s からの距離が最も短い頂点を一行で出力してください。s に隣接している頂点が存在しない場合は、inf と出力してください。

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
5 5 1
1 2 4
1 3 9
2 4 1
4 5 3
5 2 3

出力例1
2

入力例2
8 7 1
1 2 8
1 8 4
1 3 7
1 7 4
1 4 6
1 6 4
1 5 5

出力例2
6

入力例3
8 7 2
1 2 8
1 8 4
1 3 7
1 7 4
1 4 6
1 6 4
1 5 5

出力例3
inf
=end
