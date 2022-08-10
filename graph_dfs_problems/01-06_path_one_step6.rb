# パスの通れない頂点 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step6

INPUT1 = <<~"EOS"
  5 1 4
  3
  2 3 5
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
OUTPUT1 = <<~"EOS"
  -1
EOS

INPUT2 = <<~"EOS"
  5 5 3
  3
  1 2 4
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
  5 3
EOS

INPUT3 = <<~"EOS"
  8 1 5
  2
  3 7
  3
  2 3 7
  4
  1 3 7 8
  7
  1 2 4 5 6 7 8
  4
  3 6 7 8
  3
  3 6 7
  4
  3 4 5 7
  7
  1 2 3 4 5 6 8
  4
  2 3 4 7
EOS
OUTPUT3 = <<~"EOS"
  1 2 8 4 6 5
EOS

def dfs(s, t, ad_list, unused_vertices = [])
  # history の末尾 から t への経路を調べる
  results = []
  walks = [[s]]
  while walks.length > 0
    walk = walks.pop
    if walk.last == t
      results << walk
      next
    end

    # 未訪問の隣接頂点に移動する
    cv = walk.last
    ad_list[cv].each do |nv|
      # 訪問済の頂点はスキップ
      next if walk.include?(nv)
      # 通れない頂点はスキップ
      next if unused_vertices.include?(nv)
      # 新しい経路を追加
      walks << walk + [nv]
    end
  end
  results
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 通れない頂点
  unused_vertices = input_lines.shift(2).last.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # 始点 s から終点 t までの経路
  results = dfs(s, t, ad_list, unused_vertices)

  # 頂点が最も少ない経路または -1 を出力
  if results.length > 0
    # 経路の頂点数で昇順ソート
    results.sort { |a, b| a.length <=> b.length }
    # 最も頂点数が少ない経路を出力
    results.first.join(" ")
  else
    # 該当経路なしなら -1 を出力
    -1
  end
end

puts main(INPUT1)
# > -1
puts main(INPUT2)
# > 5 3
puts main(INPUT3)
# > 1 2 8 4 6 5

=begin
パスの通れない頂点 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step6
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。ただし、自己ループと多重辺は考えません。

隣接リストとある頂点の組 (s,t) と s,t を含まない頂点の集合 S が与えられます。このとき、頂点 s と頂点 t を端点とし、S の頂点を通らないパスのうち、頂点数が最も少ないものを 1 つ出力してください。複数ある場合はそのうちのどれか 1 つを出力してください。ただし、ここでパスとは頂点と枝の反復を許さない経路のことを言います。そのようなパスが存在しない場合は -1 を出力してください。

入力される値
n s t
k
s_1 ... s_k
v_1
a_{1,1} a_{1,2} ... a_{1,v_1}
v_2
a_{2,1} ... a_{2,v_2}
...
v_n
a_{n,1} ... a_{n,v_n}

・ 1 行目に、頂点の個数を表す整数 n と、端点の頂点番号 s と t が与えられます。

・ 2 行目に、頂点集合 S の頂点数を表す k が与えられます。

・ 3 行目に、頂点集合 S の頂点が与えられます。

・ 2(i+1) 行目には頂点 i に隣接している頂点の個数が与えられ、 2(i+1)+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
S の頂点を通らない頂点 s と t を端点とするパスのうち最も頂点数の少ないものを求め、そのパスが辿る頂点の番号を順番に左から半角スペース区切りで 1 行で出力してください。最も頂点数の少ないものが複数ある場合はそのうちのどれか 1 つを出力してください。一番左が s であり、一番右が t となります。そのようなパスが存在しない場合は -1 を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 12

・ 1 ≦ s,t ≦ n

・ s ≠ t

・ 1 ≦ k ≦ n-2

・ 1 ≦ s_j < s_{j+1} ≦ n (1 ≦ j ≦ k-1)

・ s_j ≠ s,t (1 ≦ j ≦ k)
・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ i ≦ n について

 ・ v_i = 1 のとき : 1 ≦ a_{i,1} ≦ n

 ・ v_i > 1 のとき : 1 ≦ a_{i,j} < a_{i,j+1} ≦ n (1 ≦ j ≦ (v_i)-1)

入力例1
5 1 4
3
2 3 5
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

出力例1
-1

入力例2
5 5 3
3
1 2 4
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
5 3

入力例3
8 1 5
2
3 7
3
2 3 7
4
1 3 7 8
7
1 2 4 5 6 7 8
4
3 6 7 8
3
3 6 7
4
3 4 5 7
7
1 2 3 4 5 6 8
4
2 3 4 7

出力例3
1 2 8 4 6 5
=end
