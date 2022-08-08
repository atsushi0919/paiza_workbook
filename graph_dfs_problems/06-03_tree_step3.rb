# 全域木の出力 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__tree_step3

INPUT1 = <<~"EOS"
  4
  1
  2
  3
  1 3 4
  2
  2 4
  2
  2 3
  1
  2 3
EOS
OUTPUT1 = <<~"EOS"
  1 2
  2 4
  4 3
EOS

INPUT2 = <<~"EOS"
  5
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
  3
  2 3
  3 5
  4 5
EOS
OUTPUT2 = <<~"EOS"
  -1
EOS

Path = Struct.new(:history, :edges)

# 全域木の経路を返す
def spanning_tree_path(s, ad_list, unused_edges)
  n = ad_list.length
  edges = Array.new(n + 1) { Array.new(n + 1, false) }
  s = Path.new([s], edges)
  paths = [s]
  while paths.length > 0
    path = paths.pop
    return path if path.history.length == n

    # 隣接頂点を調べる
    cn = path.history.last
    ad_list[cn].each do |nn|
      # 経路重複確認
      next if path.edges[cn][nn]
      # 頂点重複確認
      next if path.history.include?(nn)
      # 不使用枝確認
      next if unused_edges[cn][nn]

      # path を複製して情報更新
      new_path = Marshal.load(Marshal.dump(path))
      new_path.edges[cn][nn] = new_path.edges[nn][cn] = true
      new_path.history << nn
      paths << new_path
    end
  end
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.to_i
  # 隣接リスト
  ad_list = {}
  input_lines.shift(n * 2).each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end
  # 使わない枝
  unused_edges = Array.new(n + 1) { Array.new(n + 1, false) }
  input_lines[1..].each do |line|
    from, to = line.split.map(&:to_i)
    unused_edges[from][to] = true
    unused_edges[to][from] = true
  end

  # 全域木の経路を選択する
  path = []
  1.upto(n) do |s|
    path = spanning_tree_path(s, ad_list, unused_edges)
    next if path.nil?
    break if path.history.length == n
  end

  # 全域木の構成を返す
  path.nil? ? -1 : path.history.each_cons(2).map { |v| v.join(" ") }.join("\n")
end

puts main(STDIN.read)

=begin

# s から全ての頂点を回る経路
def spanning_tree_path(s, ad_list, unused_edges)
  n = ad_list.length
  paths = [[s]]
  while paths.length > 0
    path = paths.pop
    return path if path.length == n

    cn = path.last
    ad_list[cn].each do |nn|
      next if path.include?(nn)
      next if unused_edges[cn][nn]
      paths << path + [nn]
    end
  end
  -1
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.to_i
  # 隣接リスト
  ad_list = {}
  input_lines.shift(n * 2).each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end
  # 使わない枝
  unused_edges = Array.new(n + 1) { Array.new(n + 1, false) }
  input_lines[1..].each do |line|
    from, to = line.split.map(&:to_i)
    unused_edges[from][to] = true
    unused_edges[to][from] = true
  end

  # 1を始点として全ての頂点を回る経路を一つ選択
  path = spanning_tree_path(1, ad_list, unused_edges)

  # n-1 の全域木を出力
  path == -1 ? -1 : path.each_cons(2).map { |v| v.join(" ") }.join("\n")
end

p main(INPUT2)


問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。ただし、自己ループと多重辺は考えません。

隣接リストと枝集合 E が与えられます。このとき、この隣接リストから E に含まれない枝を n-1 個選んで全域木を構成し、出力してください。
E の枝を使わなければ全域木を構成できない場合は -1 と出力してください。

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
k
e_1 d_1
e_2 d_2
...

・ 1 行目に、頂点の個数を表す整数 n が与えられます。

・ 2i 行目には頂点 i に隣接している頂点の個数が与えられ、 2i+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

・ 2n+2 行目には全域木に使用できない枝集合 E の要素数 k が与えられ、続く k 行では、その枝を表す端点が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
全域木を構成するために選んだ E に含まれない枝をそれぞれ 1 つずつ改行して出力してください。各行は枝の端点である 2 つの頂点の番号を半角スペースで区切って出力してください。各行の頂点の順番は問いません。また、出力する枝の順番も問いません。全域木であるため合計行数は n-1 行となります。E の枝を使わなければ全域木を構成できない場合は -1 と出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 20

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ i ≦ n について

 ・ v_i = 1 のとき : 1 ≦ a_{i,1} ≦ n

 ・ v_i > 1 のとき : 1 ≦ a_{i,j} < a_{i,j+1} ≦ n (1 ≦ j ≦ (v_i)-1)

・ 1 ≦ k ≦ 1/2Σv_i - (n-1)

・ 1 ≦ e_i < d_i ≦ n (1 ≦ i ≦ k)


すべての頂点が連結していることが保証されています。

入力例1
4
1
2
3
1 3 4
2
2 4
2
2 3
1
2 3

出力例1
1 2
2 4
4 3

入力例2
5
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
3
2 3
3 5
4 5

出力例2
-1
=end
