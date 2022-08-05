# 連結の判定 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__connect_step1

INPUT1 = <<~"EOS"
  3 1 2
  2
  2 3
  2
  1 3
  2
  1 2
EOS
OUTPUT1 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  5 1 5
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
  10 1 10
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

Trail = Struct.new(:history, :edges, :count)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, k: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # 出力
  ad_list[s].include?(t) ? "Yes" : "No"
end

puts main(INPUT3)

=begin
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。ただし、自己ループと多重辺は考えません。

隣接リストとある頂点の組 (s,t) が与えられます。このとき、頂点 s と頂点 t が連結しているならば Yes 、そうでなければ No と出力してください。
ただし、s と t が連結しているとは、s と t の間にパスが存在することを意味します。

▼　下記解答欄にコードを記入してみよう

入力される値
n s t
v_1
a_{1,1} a_{1,2} ... a_{1,v_1}
v_2
a_{2,1} ... a_{2,v_2}
...
v_n
a_{n,1} ... a_{n,v_n}

・ 1 行目に、頂点の個数を表す整数 n と、頂点番号 s と t が与えられます。
・ 2i 行目には頂点 i に隣接している頂点の個数が与えられ、
2i+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
頂点 s と頂点 t が連結しているならば Yes 、そうでなければ No と 1 行で出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 12

・ 1 ≦ s,t ≦ n

・ s ≠ t

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ i ≦ n について

 ・ v_i = 1 のとき : 1 ≦ a_{i,1} ≦ n

 ・ v_i > 1 のとき : 1 ≦ a_{i,j} < a_{i,j+1} ≦ n (1 ≦ j ≦ (v_i)-1)

入力例1
3 1 2
2
2 3
2
1 3
2
1 2

出力例1
Yes

入力例2
5 1 5
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
10 1 10
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
