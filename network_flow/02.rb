# 最大流問題 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/network_flow/network_flow__max_flow_2

INPUT1 = <<"EOS"
4 5 1 4
1 2 20
1 3 15
2 3 10
2 4 20
3 4 15
EOS
OUTPUT1 = <<"EOS"
10
0 10 15 0
0 0 0 20
0 0 0 5
0 0 0 0
EOS

require "byebug"
debugger

input_lines = INPUT1.split("\n")
# 入力
# input_lines = $stdin.read.split("\n")
n, m, s, t = input_lines.shift.split.map(&:to_i)
abc = input_lines.shift(m).map { |row| row.split.map(&:to_i) }

# 隣接行列作成
capacity = Array.new(n) { Array.new(n, 0) }
abc.each { |a, b, c| capacity[a - 1][b - 1] = c }

# 初期設定
visited = Array.new(n, false)
visited[s - 1] = true
search_list = [[[s], visited]]
# dfs
while search_list.length > 0
  path, visited = search_list.pop
  v = path.last

  # s - t の経路を発見
  if v == t
    # 経路の容量を調べる
    flow = 100
    path.each_cons(2) do |a, b|
      # flow を flow と capacity[v-1][u-1] の小さい方に更新する
      flow = [flow, capacity[a - 1][b - 1]].min
    end
    # 経路に容量がある場合
    if flow > 0
      path.each_cons(2) do |a, b|
        # 各辺の容量から flow の分減らす
        capacity[a - 1][b - 1] -= flow
      end
    end
    break
  end

  # 容量の隣接行列 capacity を降順に見ていく
  n.downto(1) do |u|
    if !path.include?(u) && capacity[v - 1][u - 1] > 0
      # u が未訪問で、辺の容量が残っている場合
      # u を経路の末尾に追加
      copied_path = path.dup
      copied_path << u
      # u を訪問済みにする
      copied_visited = visited.dup
      copied_visited[u - 1] = true
      # 現在の状態を探索リスト末尾に追加
      search_list << [copied_path, copied_visited]
    end
  end
end

p capacity

=begin
その準備として、s から t へのパスを 1 つ選び、そのパス上の辺にできるだけ大きい流量のフローを流してみましょう。

辺に容量の制約がある n 頂点 m 辺のグラフが与えられます。
各頂点には 1 から n までの番号がついており、各辺は頂点 a_i から頂点 b_i へ向かうもので、容量が c_i になっています。(1 ≦ i ≦ m)
以下のアルゴリズムにしたがって s から t へのパスを 1 つ選び、できるだけ大きい流量のフローを流してください。
流したフローの流量と、最後に残ったグラフの各辺の容量 (コード中の隣接行列 capacity) をすべて出力してください。
存在しない辺については 0 を出力してください。

以下のアルゴリズムと同じ訪問順でない場合、正答が得られない可能性があるため注意してください。

s から t へのパス上にフローを流すアルゴリズム (擬似コード):

・ 以下の関数を定義する。


// 頂点 v から td まで最大で流量 f のフローを流し、流れたフローの流量を返す関数
push_flow(v, td, f)
    // v が td であれば、フローが流れたことになる
    if v == td
        return f
    
    // v を訪問済みにする
    visited[v] = true

    // 容量の隣接行列 capacity を順に見ていく
    for u = 1 to n
        // u が未訪問で、辺の容量が残っている場合
        if visited[u] == false && capacity[v][u] > 0
            // 容量を f と capacity[v][u] の小さいほうにしてフローを流す
            f' = push_flow(u, td, min(f, capacity[v][u]))
            // もしフローが流れた場合
            if f' > 0
                // 容量を減らす
                capacity[v][u] -= f'
                // フローが流れた量を返す
                return f'

    // この頂点から td までフローを流せなかった場合は 0 を返す
    return 0


・ push_flow(s, t, 100) を呼び出す。(100 は流量の上限)
▼　下記解答欄にコードを記入してみよう

入力される値
n m s t
a_1 b_1 c_1
a_2 b_2 c_2
...
a_m b_m c_m

・ 1 行目に、グラフの頂点数を表す整数 n, グラフの辺数を表す整数 m, フローの始点、終点の頂点の番号を表す整数 s, t が半角スペース区切りで与えられます。
・ 続く m 行では、各辺の情報を表す整数 a_i, b_i, c_i が半角スペース区切りで与えられます。(1 ≦ i ≦ m) a_i, b_i は、
辺の始点、終点の頂点の番号を表します。c_i は、i 番目の辺に流すことのできる最大の流量を表します。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
合計 n + 1 行出力してください。
1 行目に、フローの流量を表す整数を出力してください。
1 + i 行目に、頂点 i から各頂点 1, 2, ..., n へ向かう辺の容量を半角スペース区切りで出力してください。
(1 ≦ i ≦ n) 存在しない辺については 0 を出力してください。
また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ n ≦ 100 = 10^2
・ 1 ≦ m ≦ 10,000 = 10^4
・ 1 ≦ s, t, a_i, b_i ≦ n
・ 1 ≦ c_i ≦ 100 = 10^2
・ s ≠ t, a_i ≠ b_i
・ (a_i, b_i) ≠ (a_j, b_j) (i ≠ j)

入力例1
4 5 1 4
1 2 20
1 3 15
2 3 10
2 4 20
3 4 15

出力例1
10
0 10 15 0
0 0 0 20
0 0 0 5
0 0 0 0
=end
