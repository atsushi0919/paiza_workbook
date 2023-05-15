# 連結判定 (paizaランク A 相当)
# https://paiza.jp/works/mondai/bfs_dfs_problems_advanced/bfs_dfs_problems_advanced__connected

INPUT1 = <<"EOS"
3 3 2
RRR
GGR
BRR
1 1 3 2
1 1 3 1
EOS
OUTPUT1 = <<"EOS"
Yes
No
EOS

# 方向設定 x↓ y→
DIR = [[-1, 0], [0, 1], [1, 0], [0, -1]]

# 入力
input_lines = $stdin.read.split("\n")
n, m, k = input_lines.shift.split.map(&:to_i)
s = input_lines.shift(n)
abcd = input_lines.shift(k).map { |r| r.split.map(&:to_i) }

searched = Array.new (n) { Array.new(m, nil) }
group_count = 0
0.upto(n - 1) do |x|
  0.upto(m - 1) do |y|
    # 探索開始地点
    next unless searched[x][y].nil?
    color = s[x][y]

    # 探索開始地点から連結成分を調べる
    group_count += 1
    search_list = [[x, y]]
    while search_list.length > 0
      cx, cy = search_list.shift
      next unless searched[cx][cy].nil?

      searched[cx][cy] = group_count
      DIR.each do |dx, dy|
        nx = cx + dx
        ny = cy + dy
        next if nx < 0 || n - 1 < nx || ny < 0 || m - 1 < ny
        next if s[nx][ny] != color

        search_list << [nx, ny]
      end
    end
  end
end

# (a,b) と (c,d) が同じ連結成分か判定して出力
puts abcd.map { |a, b, c, d|
  searched[a - 1][b - 1] == searched[c - 1][d - 1] ? "Yes" : "No"
}.join("\n")

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
ここに、'R', 'G', 'B' (それぞれ赤、緑、青) で構成される n × m のグリッドがあります。

ここで、グリッドの上から a 行目、左から b 列目のマスを、マス (a, b) と呼ぶことにします。
整数の組 a, b, c, d が k 個与えられるので、それぞれについて、マス (a, b) とマス (c, d) が同じ連結成分に属するかどうかを判定してください。

なお、連結成分とは、以下のような条件を満たすマスの集合のことをいいます。
・ 集合内のすべての 2 つのマスは、その集合に含まれる上下左右で隣接するマスへの移動を繰り返すことで行き来することができる。
・ 集合に含まれるすべてのマスは、同じ色である。
・ 集合に含まれないどのマスを追加しても、上のいずれかの条件を満たさなくなる。

▼　下記解答欄にコードを記入してみよう

入力される値
n m k
s_1
s_2
...
s_n
a_1 b_1 c_1 d_1
a_2 b_2 c_2 d_2
...
a_k b_k c_k d_k

・ 1 行目に、グリッドの行数を表す整数 n, グリッドの列数を表す整数 m, マスの組の個数を表す整数 k が半角スペース区切りで与えられます。
・ 続く n 行では、グリッドの各行の各マスを表す文字列 s_i が改行区切りで与えられます。(1 ≦ i ≦ n)
・ 続く k 行では、マスの組を表す整数値 a_j, b_j, c_j, d_j が半角スペース区切りで与えられます。(1 ≦ j ≦ k)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
合計 k 行出力してください。

i 行目には、マス (a_i, b_i) とマス (c_i, d_i) が同じ連結成分に属するならば 'Yes'、そうでなければ 'No' を出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ n, m ≦ 1,000
・ s_i は 'R', 'G', 'B' からなる長さ m の文字列
・ 1 ≦ k ≦ 100,000 = 10^5
・ 1 ≦ a_i, c_i ≦ n
・ 1 ≦ b_i, d_i ≦ m
・ n, m, k, a_i, b_i, c_i, d_i は整数

入力例1
3 3 2
RRR
GGR
BRR
1 1 3 2
1 1 3 1

出力例1
Yes
No
=end
