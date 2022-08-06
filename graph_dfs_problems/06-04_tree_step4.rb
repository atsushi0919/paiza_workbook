# 全域木の出力 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__tree_step4

INPUT1 = <<~"EOS"
  4
  1
  4
  1
  2
  3
  1 3 4
  2
  2 4
  2
  2 3
EOS
OUTPUT1 = <<~"EOS"
  1 2
  2 3
EOS

INPUT2 = <<~"EOS"
  5
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
OUTPUT2 = <<~"EOS"
  -1
EOS

# s から全ての頂点を回る経路
def spanning_tree_path(s, ad_list, unused_nodes)
  n = ad_list.length
  paths = [[s]]
  while paths.length > 0
    path = paths.pop
    return path if path.length == n

    cn = path.last
    ad_list[cn].each do |nn|
      next if path.include?(nn)
      next if unused_nodes.include?(nn)
      paths << path + [nn]
    end
  end
  -1
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.to_i
  # 通らない頂点
  unused_nodes = input_lines.shift(2).last.split.map(&:to_i)
  # 通らない頂点以外の頂点数
  n -= unused_nodes.length

  # 隣接リスト
  ad_list = {}
  input_lines.shift(n * 2).each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # unused_nodes 以外の適当な頂点を始点 s とする
  s = -1
  1.upto(n) do |v|
    if not unused_nodes.include?(v)
      s = v
      break
    end
  end

  # 1を始点として全ての頂点を回る経路を一つ選択
  path = spanning_tree_path(s, ad_list, unused_nodes)

  # unused_nodes 以外の全域木を出力
  path == -1 ? -1 : path.each_cons(2).map { |v| v.join(" ") }.join("\n")
end

p main(INPUT2)

=begin

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。ただし、自己ループと多重辺は考えません。
隣接リストと頂点集合 S が与えられます。このとき、S の頂点を含まず、かつ S に含まれない頂点を全て含む木を出力してください。

そのような木が存在しない場合は -1 と出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
k
s_1 ... s_k
v_1
a_{1,1} a_{1,2} ... a_{1,v_1}
v_2
a_{2,1} ... a_{2,v_2}
...
v_n
a_{n,1} ... a_{n,v_n}

・ 1 行目に、頂点の個数を表す整数 n が与えられます。

・ 2 行目に、頂点集合 S の頂点数を表す k が与えられます。

・ 3 行目に、頂点集合 S の頂点が与えられます。

・ 2(i+1) 行目には頂点 i に隣接している頂点の個数が与えられ、
2(i+1)+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
頂点集合 S に含まれない頂点を全て含む木を構成するために選んだ枝をそれぞれ 1 つずつ改行して出力してください。
各行は枝の端点である 2 つの頂点の番号を半角スペースで区切って出力してください。各行の頂点の順番は問いません。また、出力する枝の順番も問いません。
S 以外の頂点の全域木であるため合計行数は n-k-1 行となります。そのような木が存在しない場合は -1 と出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 20

・ 1 ≦ k ≦ n-2

・ 1 ≦ s_j < s_{j+1} ≦ n (1 ≦ j ≦ k-1)

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ i ≦ n について

 ・ v_i = 1 のとき : 1 ≦ a_{i,1} ≦ n

 ・ v_i > 1 のとき : 1 ≦ a_{i,j} < a_{i,j+1} ≦ n (1 ≦ j ≦ (v_i)-1)


すべての頂点が連結していることが保証されています。

入力例1
4
1
4
1
2
3
1 3 4
2
2 4
2
2 3

出力例1
1 2
2 3

入力例2
5
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

出力例2
-1
=end
