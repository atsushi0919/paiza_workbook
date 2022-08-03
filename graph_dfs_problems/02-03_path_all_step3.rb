# グラフのパス 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__path_all_step3

INPUT1 = <<~"EOS"
  4 2 4
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
  0
EOS

INPUT2 = <<~"EOS"
  5 5 3
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
  4
  5 1 2 3
  5 2 3 4
  5 3 2 1
  5 4 3 2
EOS

INPUT3 = <<~"EOS"
  7 1 3
  6
  2 3 4 5 6 7
  2
  1 7
  2
  1 4
  2
  1 3
  2
  1 6
  2
  1 5
  2
  1 2
EOS
OUTPUT3 = <<~"EOS"
  0
EOS

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, k: 回数
  n, s, k = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  adjacent_list = []
  input_lines.each_with_index do |line, idx|
    next if idx.even?
    adjacent_list << line.split.map(&:to_i)
  end

  # k 回移動
  results = []
  walks = [[s]]
  while walks.length > 0
    current_walk = walks.shift
    if current_walk.length == k + 1
      results << current_walk
      next
    end
    # 隣接頂点に移動する
    adjacent_list[current_walk.last - 1].each do |next_node|
      next if current_walk.include?(next_node)
      walks << current_walk + [next_node]
    end
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

隣接リストとある頂点 s と自然数 k が与えられます。
このとき、頂点 s から k 回移動する経路（パス）を全て出力してください。
ただし、ここでパスとは頂点と枝の反復を許さない経路のことを言います。

▼　下記解答欄にコードを記入してみよう

入力される値
n s k
v_1
a_1 a_2 ... a_{v_1}
v_2
a_1 ... a_{v_2}
...
v_n
a_1 ... a_{v_n}

・ 1 行目に、頂点の個数を表す整数 n と、出発点（始点）の頂点番号 s と移動回数を表す自然数 k が与えられます。

・ 2i 行目には頂点 i に隣接している頂点の個数が与えられ、
2i+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 行目にパスの総数を出力してください。その後改行して、
頂点 s から k 回移動するパスで辿った頂点の番号を順番に左から半角スペース区切りで、それぞれ改行して出力してください。
2 行目以降に出力するパスの順番は問いません。
各パスは一番左が s であり、頂点の数は s を合わせて k+1 個になります。全てのパスが W 個ならば、
1 行目に W と出力し、その後 W 行出力してください。k 回移動できるパスが存在しない場合があることに注意してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 12

・ 1 ≦ s ≦ n

・ 1 ≦ k ≦ 5

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ a_j < a_{j+1} ≦ n (1 ≦ j ≦ (v_i)-1, 1 ≦ i ≦ n)

入力例1
4 2 4
1
2
3
1 3 4
2
2 4
2
2 3

出力例1
0

入力例2
5 5 3
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
4
5 1 2 3
5 2 3 4
5 3 2 1
5 4 3 2

入力例3
7 1 3
6
2 3 4 5 6 7
2
1 7
2
1 4
2
1 3
2
1 6
2
1 5
2
1 2

出力例3
0
=end
