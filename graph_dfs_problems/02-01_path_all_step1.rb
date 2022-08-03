# 隣接頂点の出力 2 (paizaランク D 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step1

INPUT1 = <<~"EOS"
  3 2
  1
  2
  2
  1 3
  1
  2
EOS
OUTPUT1 = <<~"EOS"
  1 3
EOS

INPUT2 = <<~"EOS"
  5 5
  2
  2 5
  3
  1 3 5
  3
  2 4 5
  2
  3 5
  4
  1 2 3 4
EOS
OUTPUT2 = <<~"EOS"
  1 2 3 4
EOS

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 探索対象の頂点
  n, s = input_lines.shift.split.map(&:to_i)
  edges = input_lines.each_slice(2).map do |lines|
    lines.last.split.map(&:to_i).sort
  end

  # s の隣接頂点を全て表示
  if edges[s - 1].length > 0
    edges[s - 1].join(" ")
  else
    -1
  end
end

puts main(STDIN.read)

=begin
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。
ただし、自己ループと多重辺は考えません。

隣接リストとある頂点 s が与えられます。
このとき、頂点 s に隣接している頂点を番号の小さい順に全て出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n s
v_1
a_1 a_2 ... a_{v_1}
v_2
a_1 ... a_{v_2}
...
v_n
a_1 ... a_{v_n}

・ 1 行目に、頂点の個数を表す整数 n と、頂点番号 s が与えられます。

・ 2i 行目には頂点 i に隣接している頂点の個数が与えられ、
2i+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
s の隣接頂点を左から小さい順に全て半角スペース区切りで 1 行で出力してください。隣接頂点がない場合は-1を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 20

・ 1 ≦ s ≦ n

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ a_j < a_{j+1} ≦ n (1 ≦ j ≦ (v_i)-1, 1 ≦ i ≦ n)

入力例1
3 2
1
2
2
1 3
1
2

出力例1
1 3

入力例2
5 5
2
2 5
3
1 3 5
3
2 4 5
2
3 5
4
1 2 3 4

出力例2
1 2 3 4
=end
