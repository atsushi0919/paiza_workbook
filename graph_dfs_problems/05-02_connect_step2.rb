# グラフ全体の連結の判定 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__connect_step2

INPUT1 = <<~"EOS"
  3
  2
  2 3
  2
  1 3
  2
  1 2
EOS
INPUT21 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  5
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
  10
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

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  connection = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
    connection[idx / 2] = false
  end

  # 全ての頂点が接続されているか
  routes = [[1]]
  while routes.length > 0
    route = routes.pop
    cv = route.last
    connection[cv] = true
    break if connection.values.all?

    # 隣接頂点を調べる
    ad_list[cv].each do |nv|
      next if route.include?(nv)
      routes << route + [nv]
    end
  end
  # 出力
  connection.values.all? ? "Yes" : "No"
end

puts main(INPUT1)

=begin

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。ただし、自己ループと多重辺は考えません。

隣接リストが与えられます。このとき、グラフ全体が連結しているならば Yes 、そうでなければ No と出力してください。
ただし、グラフ全体が連結しているとは、グラフの任意の 2 頂点間にパスが存在することを意味します。
また、グラフの任意の 2 頂点間にパスが存在することと、ある頂点から任意の頂点にパスが存在することは同値です。

▼　下記解答欄にコードを記入してみよう

入力される値
n
v_1
a_{1,1} a_{1,2} ... a_{1,v_1}
v_2
a_{2,1} ... a_{2,v_2}
...
v_n
a_{n,1} ... a_{n,v_n}

・ 1 行目に、頂点の個数を表す整数 n が与えられます。

・ 2i 行目には頂点 i に隣接している頂点の個数が与えられ、 2i+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
グラフ全体が連結しているならば Yes 、そうでなければ No と 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 12

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ i ≦ n について

 ・ v_i = 1 のとき : 1 ≦ a_{i,1} ≦ n

 ・ v_i > 1 のとき : 1 ≦ a_{i,j} < a_{i,j+1} ≦ n (1 ≦ j ≦ (v_i)-1)

入力例1
3
2
2 3
2
1 3
2
1 2

出力例1
Yes

入力例2
5
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

出力例2
No

入力例3
10
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

出力例3
No
=end
