# パスの経由地 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step5

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
  5
  1 2 3 4
  1 2 3 5 4
  1 2 5 3 4
  1 5 2 3 4
  1 5 3 4
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
  1
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
  0
EOS

def dfs(adjacent_list, history, t)
  # history の末尾 から t への経路を調べる
  results = []
  walks = [history]
  while walks.length > 0
    current_walk = walks.pop
    if current_walk.last == t
      results << current_walk
      next
    end

    # 未訪問の隣接頂点に移動する
    adjacent_list[current_walk.last - 1].each do |next_node|
      next if current_walk.include?(next_node)
      walks << current_walk + [next_node]
    end
  end
  results
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点, p: 中継点
  n, s, t, p = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = []
  input_lines.each_with_index do |line, idx|
    next if idx.even?
    adjacent_list << line.split.map(&:to_i)
  end

  # 始点 s から中継点 p までの経路
  s_to_p = dfs(adjacent_list, [s], p)
  # 中継点 p から終点 t までの経路
  results = []
  s_to_p.each do |walk|
    tmp = dfs(adjacent_list, walk, t)
    results.concat(tmp) if tmp.length > 0
  end
  # 経路数と経路を全て出力
  [results.length.to_s].concat(results.map { |e| e.join(" ") }).join("\n")
end

puts main(STDIN.read)

=begin
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。
ただし、自己ループと多重辺は考えません。

隣接リストとある頂点の組 (s,t) と s, t ではない頂点 p が与えられます。
このとき、頂点 s と頂点 t を端点とし、頂点 p を経由するパスを全て出力してください。
ただし、ここでパスとは頂点と枝の反復を許さない経路のことを言います。

▼　下記解答欄にコードを記入してみよう

入力される値
n s t p
v_1
a_1 a_2 ... a_{v_1}
v_2
a_1 ... a_{v_2}
...
v_n
a_1 ... a_{v_n}

・ 1 行目に、頂点の個数を表す整数 n と、端点の頂点番号 s と t と経由地の頂点番号 p が与えられます。

・ 2i 行目には頂点 i に隣接している頂点の個数が与えられ、 2i+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 行目にパスの総数を出力してください。その後改行して、頂点 p を経由する頂点 s と t を端点とするパスを全て求め、各パスが辿る頂点の番号を順番に左から半角スペース区切りでそれぞれ改行して出力してください。2 行目以降に出力するパスの順番は問いません。各パスは一番左が s であり、一番右が t となります。全てのパスが W 個ならば、1 行目に W と出力し、その後 W 行出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 10

・ 1 ≦ s,t,p ≦ n

・ s ≠ t

・ p ≠ s,t

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ a_j < a_{j+1} ≦ n (1 ≦ j ≦ (v_i)-1, 1 ≦ i ≦ n)

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
5
1 2 3 4
1 2 3 5 4
1 2 5 3 4
1 5 2 3 4
1 5 3 4

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
1
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
0
=end
