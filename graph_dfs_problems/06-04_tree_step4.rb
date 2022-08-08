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

INPUT3 = <<~"EOS"
  4
  2
  3 4
  2
  2 4
  3
  1 3 4
  2
  2 4
  3
  1 2 3
EOS
OUTPUT3 = <<~"EOS"
EOS

INPUT4 = <<~"EOS"
  5
  1
  3
  2
  4 5
  2
  3 4
  3
  2 4 5
  4
  1 2 3 5
  3
  1 3 4
EOS
OUTPUT4 = <<~"EOS"
EOS

INPUT5 = <<~"EOS"
  14
  3
  4 8 13
  5
  5 8 9 11 13
  6
  3 4 7 10 13 14
  6
  2 6 9 10 12 14
  6
  2 7 9 11 13 14
  4
  1 6 13 14
  4
  3 5 10 12
  5
  2 4 12 13 14
  3
  1 11 12
  4
  1 3 4 14
  4
  2 3 6 12
  3
  1 4 8
  6
  3 6 7 8 10 14
  6
  1 2 4 5 7 14
  8
  2 3 4 5 7 9 12 13
EOS
OUTPUT5 = <<~"EOS"
EOS

INPUT6 = <<~"EOS"
  11
  3
  3 9 10
  3
  3 7 9
  3
  4 6 7
  7
  1 4 5 7 8 10 11
  5
  2 3 6 7 9
  4
  3 7 10 11
  3
  2 4 11
  7
  1 2 3 4 5 8 9
  4
  3 7 10 11
  3
  1 4 7
  4
  3 5 8 11
  5
  3 5 6 8 10
EOS

INPUT7 = <<~"EOS"
  7
  4
  3 4 5 7
  3
  2 5 6
  3
  1 3 6
  3
  2 5 6
  2
  6 7
  3
  1 3 7
  5
  1 2 3 4 7
  3
  4 5 6
EOS
OUTPUT7 = <<~"EOS"
EOS

INPUT8 = <<~"EOS"
  18
  5
  6 12 14 15 18
  6
  2 3 5 7 10 13
  9
  1 3 7 8 12 13 15 17 18
  10
  1 2 4 7 10 12 13 15 17 18
  5
  3 7 8 11 14
  4
  1 13 14 16
  3
  8 13 14
  10
  1 2 3 4 8 12 14 15 16 17
  7
  2 4 6 7 10 11 15
  5
  10 12 15 16 18
  9
  1 3 8 9 11 12 15 17 18
  7
  4 8 10 12 14 15 17
  11
  2 3 7 9 10 11 14 15 16 17 18
  6
  1 2 3 5 6 15
  7
  4 5 6 7 11 12 15
  11
  2 3 7 8 9 10 11 12 13 14 17
  4
  5 7 9 12
  8
  2 3 7 10 11 12 15 18
  6
  2 3 9 10 12 17
EOS
OUTPUT8 = <<~"EOS"
EOS

INPUT9 = <<~"EOS"
  13
  6
  5 8 9 10 11 12
  5
  4 5 6 11 12
  4
  4 7 8 13
  4
  5 9 10 13
  7
  1 2 6 7 8 9 10
  3
  1 3 8
  6
  1 4 7 8 10 11
  6
  2 4 6 9 10 12
  6
  2 4 5 6 10 12
  3
  3 4 7
  7
  3 4 6 7 8 11 12
  5
  1 6 10 12 13
  6
  1 7 8 10 11 13
  4
  2 3 11 12
EOS
OUTPUT9 = <<~"EOS"
EOS

INPUT10 = <<~"EOS"
  4
  1
  3
  3
  2 3 4
  3
  1 3 4
  2
  1 2
  2
  1 2
EOS
OUTPUT10 = <<~"EOS"
EOS

INPUT11 = <<~"EOS"
  5
  2
  3 4
  2
  3 5
  2
  4 5
  3
  1 4 5
  3
  2 3 5
  4
  1 2 3 4
EOS
OUTPUT11 = <<~"EOS"
EOS

INPUT12 = <<~"EOS"
  15
  4
  2 3 7 11
  3
  12 14 15
  6
  3 6 9 12 14 15
  6
  2 4 6 7 8 13
  10
  3 5 6 8 9 10 11 12 13 14
  3
  4 12 15
  9
  2 3 4 7 8 9 11 13 14
  5
  3 6 9 11 12
  8
  3 4 6 9 10 11 14 15
  9
  2 4 6 7 8 10 11 13 15
  5
  4 8 9 13 14
  7
  4 6 7 8 9 13 15
  5
  1 2 4 5 7
  7
  3 4 6 9 10 11 14
  7
  1 2 4 6 8 10 13
  6
  1 2 5 8 9 11
EOS
OUTPUT12 = <<~"EOS"
EOS

Path = Struct.new(:history, :edges)

# 全域木の経路を返す
def spanning_tree_path(s, ad_list, unused_nodes = [])
  n = ad_list.length
  edges = Array.new(n + 1) { Array.new(n + 1, false) }
  results = []
  connected = {}
  ad_list.keys.each do |v|
    unless unused_nodes.include?(v)
      connected[v] = false
    end
  end
  connected[s] = true
  s = Path.new([s], edges)
  paths = [s]
  while paths.length > 0
    end_point = true
    path = paths.pop
    if connected.values.all?
      paths.each { |path| results << path.history }
      results << path.history
      return [true, results]
    end

    # 隣接頂点を調べる
    cn = path.history.last
    ad_list[cn].each do |nn|
      # スキップ条件
      next if path.edges[cn][nn]
      next if path.history.include?(nn)
      next if unused_nodes.include?(nn)

      # path を複製して情報更新
      new_path = Marshal.load(Marshal.dump(path))
      new_path.edges[cn][nn] = new_path.edges[nn][cn] = true
      new_path.history << nn
      paths << new_path
      connected[nn] = true
      end_point = false
    end
    results << path.history if end_point
  end
  false
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.to_i
  # 通らない頂点
  unused_nodes = input_lines.shift(2).last.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # 全域木の経路を調査する
  sp_tree = false
  s = (1..n).find { |v| not unused_nodes.include?(v) }
  sp_tree, paths = spanning_tree_path(s, ad_list, unused_nodes)

  # 全域木の構成を生成して出力
  if sp_tree
    connected = [s]
    sp_tree_path = []
    paths.each do |path|
      path.each_cons(2) do |a, b|
        next if connected.include?(b)
        connected << b
        sp_tree_path << [a, b]
      end
    end
    sp_tree_path.map { |v| v.join(" ") }.join("\n")
  else
    -1
  end
end

puts main(INPUT11)

=begin

方針
step 2 と全く同じ再帰関数を用いて深さ優先探索を行うことで解くことができます。
そのためには、与えられた隣接リストから使えない頂点をあらかじめ削除しておく必要があります。
条件を満たす全域木が存在しない場合、-1 を出力する操作を忘れないように気を付けましょう。
実装例
Python3の場合

n = int(input())
k = int(input())
S = set(map(int, input().split()))
ad_list = {}
for i in range(1, n + 1):
    v = int(input())
    ad_list[i] = list(map(int, input().split()))
for i in S:
    for j in ad_list[i]:
        ad_list[j].remove(i)
    ad_list[i].clear()
tree = []
def dfs(v, visited):
    for i in ad_list[v]:
        if i not in visited:
            visited.append(i)
            tree.append((v, i))
            dfs(i, visited)
vertices = set(range(1, n + 1)) - S
dfs(min(vertices), [min(vertices)])
if len(tree) == n - k - 1:
    for e in tree:
        print(*e)
else:
    print("-1")


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
