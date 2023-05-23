=begin
ダイクストラ法での経路復元 (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__dijkstra_path
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
1,...,N の番号のついた N 個の頂点とそれらをつなぐ枝からなる有向グラフを考えます。ただし、自己ループと多重辺は考えません。

M 本の有向枝と頂点番号 s, t が与えられます。頂点 s から頂点 t までの最短距離とその経路を出力してください。最短距離の経路が複数存在する場合は、そのうちのどれかひとつを出力してください。頂点 s から頂点 t へ経路が存在しない場合は、inf と出力してください。

ただし、頂点 s から距離が同じ頂点が複数存在する場合は、そのなかで番号が最も小さい頂点を、頂点 s から最も距離が短い頂点とします。また、距離とはその頂点までの経路（枝の集合）を構成する枝の重みの和とします。

▼　下記解答欄にコードを記入してみよう

入力される値
N M s t
a_1 b_1 c_1
...
a_M b_M c_M

1 行目に、頂点の個数を表す N と、枝の本数を表す整数 M と、頂点の番号を表す整数 s が与えられます。

i + 1 行目に枝 i を表す整数の組 (a_i,b_i,c_i) が与えられます。枝 i は、頂点 a_i から頂点 b_i に向かう枝で、その重み（距離）は c_i です。(1 ≦ i ≦ M)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
合計一行または二行出力してください。経路が存在する場合は、一行目に頂点 s から頂点 t までの最短距離を出力し、二行目にはその経路で辿る頂点を順番に左から半角スペース区切りで出力してください。最短距離の経路が複数存在する場合は、そのうちのどれかひとつを出力してください。経路が存在しない場合は一行で inf と出力してください。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


入力はすべて整数

2 ≦ N ≦ 100

1 ≦ M ≦ N × (N-1)

1 ≦ s,t ≦ N

s ≠ t

1 ≦ a_i, b_i ≦ N (1 ≦ i ≦ M)

a_i ≠ b_i (1 ≦ i ≦ M)

1 ≦ c_i ≦ 10 (1 ≦ i ≦ M)

同じ頂点の組（順序組）は 2 回以上入力されない
入力例1
7 11 1 7
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
4
1 2 5 7

入力例2
8 7 2 7
2 3 8
1 8 4
1 3 7
1 7 4
1 4 6
1 6 4
1 5 5

出力例2
inf

入力例3
5 6 1 5
1 2 1
1 3 1
2 3 1
2 4 2
3 4 2
4 5 5

出力例3
8
1 2 4 5
=end