# パスの経由地 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step5

INPUT1 = <<~"EOS"
  5 1 4 3
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
  1 2 3 4
EOS

INPUT2 = <<~"EOS"
  5 5 3 1
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
  5 1 2 3
EOS

INPUT3 = <<~"EOS"
  8 8 4 1
  1
  2
  7
  1 3 4 5 6 7 8
  6
  2 4 5 6 7 8
  6
  2 3 5 6 7 8
  6
  2 3 4 6 7 8
  6
  2 3 4 5 7 8
  6
  2 3 4 5 6 8
  6
  2 3 4 5 6 7
EOS
OUTPUT3 = <<~"EOS"
  -1
EOS

def dfs(s, t, q, ad_list)
  results = []
  walks = [[s]]
  while walks.length > 0
    walk = walks.pop

    # q を経由して t に着いたら経路を記録
    if walk.last == t && walk.include?(q)
      results << walk
      next
    end

    # 未訪問の隣接頂点に移動する
    cv = walk.last
    ad_list[cv].each do |nv|
      # 訪問済の頂点はスキップ
      next if walk.include?(nv)
      # 新しい経路を追加
      walks << walk + [nv]
    end
  end
  results
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点, q: 中継点
  n, s, t, q = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # q を経由して s から t へ行ける経路
  results = dfs(s, t, q, ad_list)

  # 頂点が最も少ない経路、または -1 を出力
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

p main(INPUT1)
# > 1 5 3 4
p main(INPUT2)
# > 5 1 2 3
p main(INPUT3)
# > -1

=begin
パスの経由地 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_one_step5
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
 チケット使用済
問題
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。ただし、自己ループと多重辺は考えません。

隣接リストとある頂点の組 (s,t) と s, t ではない頂点 p が与えられます。このとき、頂点 s と頂点 t を端点とし、頂点 p を経由するパスのうち、頂点数が最も少ないものを 1 つ出力してください。複数ある場合はそのうちのどれか 1 つを出力してください。ただし、ここでパスとは頂点と枝の反復を許さない経路のことを言います。そのようなパスが存在しない場合は -1 を出力してください。

入力される値
n s t p
v_1
a_{1,1} a_{1,2} ... a_{1,v_1}
v_2
a_{2,1} ... a_{2,v_2}
...
v_n
a_{n,1} ... a_{n,v_n}

・ 1 行目に、頂点の個数を表す整数 n と、端点の頂点番号 s と t と経由地の頂点番号 p が与えられます。

・ 2i 行目には頂点 i に隣接している頂点の個数が与えられ、 2i+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
頂点 p を経由する頂点 s と t を端点とするパスのうち最も頂点数の少ないものを求め、
そのパスが辿る頂点の番号を順番に左から半角スペース区切りで 1 行で出力してください。
最も頂点数の少ないものが複数ある場合はそのうちのどれか 1 つを出力してください。一番左が s であり、一番右が t となります。
そのようなパスが存在しない場合は -1 を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 12

・ 1 ≦ s,t,p ≦ n

・ s ≠ t

・ p ≠ s,t

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ i ≦ n について

 ・ v_i = 1 のとき : 1 ≦ a_{i,1} ≦ n

 ・ v_i > 1 のとき : 1 ≦ a_{i,j} < a_{i,j+1} ≦ n (1 ≦ j ≦ (v_i)-1)

入力例1
5 1 4 3
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
1 2 3 4

入力例2
5 5 3 1
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
5 1 2 3

入力例3
8 8 4 1
1
2
7
1 3 4 5 6 7 8
6
2 4 5 6 7 8
6
2 3 5 6 7 8
6
2 3 4 6 7 8
6
2 3 4 5 7 8
6
2 3 4 5 6 8
6
2 3 4 5 6 7

出力例3
-1
=end
