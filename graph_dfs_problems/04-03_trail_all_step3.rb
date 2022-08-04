# グラフの s,t トレイル 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_all_step3

INPUT1 = <<~"EOS"
  4 2 3
  3
  2 3 4
  3
  1 3 4
  3
  1 2 4
  3
  1 2 3
EOS
OUTPUT1 = <<~"EOS"
  6
  2 1 3 2 4 3
  2 1 3 4 2 3
  2 3 1 2 4 3
  2 3 4 2 1 3
  2 4 3 1 2 3
  2 4 3 2 1 3
EOS

INPUT2 = <<~"EOS"
  5 1 5
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
  0
EOS

Walk = Struct.new(:history, :adjacent_list)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = []
  input_lines.each_with_index do |line, idx|
    next if idx.even?
    adjacent_list << line.split.map(&:to_i)
  end

  # s から t への経路を調べる
  results = []
  walks = [Walk.new([s], Marshal.load(Marshal.dump(adjacent_list)))]
  while walks.length > 0
    current_walk = walks.pop
    if current_walk.history.last == t \
      && current_walk.history.count(s) > 1 \
      && current_walk.history.count(t) > 1
      # 経路を記録
      results << current_walk.history
    end
    # 隣接頂点に移動する
    current_walk.adjacent_list[current_walk.history.last - 1].each do |next_node|
      # 現在の情報を複製
      new_walk = Marshal.load(Marshal.dump(current_walk))
      # 一度通った辺を削除
      new_walk.adjacent_list[new_walk.history.last - 1].delete(next_node)
      new_walk.adjacent_list[next_node - 1].delete(new_walk.history.last)
      new_walk.history << next_node
      walks << new_walk
    end
  end
  # 経路数と経路を全て出力
  [results.length.to_s].concat(results.map { |e| e.join(" ") }).join("\n")
end

puts main(STDIN.read)

=begin
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。ただし、自己ループと多重辺は考えません。

隣接リストとある頂点の組 (s,t) が与えられます。
このとき、頂点 s と頂点 t を端点とするトレイルのうち、
s と t どちらの頂点も通過点としても含む(s と t のどちらもトレイルに 2 回以上含まれる）ものを全て出力してください。
  ただし、ここでトレイルとは枝の反復を許さず頂点の反復を許す経路のことを言います。

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

・ 1 行目に、頂点の個数を表す整数 n と、端点の頂点番号 s と t が与えられます。

・ 2i 行目には頂点 i に隣接している頂点の個数が与えられ、 2i+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 行目にトレイルの総数を出力してください。
その後改行して、頂点 s と t を端点とし、かつ s と t を通過するトレイルを全て求め、
各トレイルが辿る頂点の番号を順番に左から半角スペース区切りでそれぞれ改行して出力してください。
2 行目以降に出力するトレイルの順番は問いません。
各トレイルは一番左が s であり、一番右が t となり、その間には、s と t が 1 回以上含まれている必要があります。
全てのトレイルが W 個ならば、1 行目に W と出力し、その後 W 行出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 6

・ 1 ≦ s,t ≦ n

・ s ≠ t

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ i ≦ n について

 ・ v_i = 1 のとき : 1 ≦ a_{i,1} ≦ n

 ・ v_i > 1 のとき : 1 ≦ a_{i,j} < a_{i,j+1} ≦ n (1 ≦ j ≦ (v_i)-1)

入力例1
4 2 3
3
2 3 4
3
1 3 4
3
1 2 4
3
1 2 3

出力例1
6
2 1 3 2 4 3
2 1 3 4 2 3
2 3 1 2 4 3
2 3 4 2 1 3
2 4 3 1 2 3
2 4 3 2 1 3

入力例2
5 1 5
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
0
=end
