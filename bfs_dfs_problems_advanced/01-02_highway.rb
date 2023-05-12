# 高速道路 (paizaランク B 相当)
# https://paiza.jp/works/mondai/bfs_dfs_problems_advanced/bfs_dfs_problems_advanced__highway


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