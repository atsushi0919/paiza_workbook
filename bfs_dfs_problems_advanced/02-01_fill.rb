# 塗りつぶし (paizaランク B 相当)
# https://paiza.jp/works/mondai/bfs_dfs_problems_advanced/bfs_dfs_problems_advanced__fill

INPUT1 = <<"EOS"
3 3 1 1
..#
##.
...
EOS
OUTPUT1 = <<"EOS"
++#
##.
...
EOS

# 方向設定 x↓ y→
DIR = [[-1, 0], [0, 1], [1, 0], [0, -1]]

# 入力
input_lines = $stdin.read.split("\n")
n, m, x, y = input_lines.shift.split.map(&:to_i)
s = input_lines.shift(n).map(&:chars)

# (x, y) からスタート
search_list = [[x - 1, y - 1]]
# BFS (x,y) から色を塗る
while search_list.length > 0
  # 現在の座標を調べる
  cx, cy = search_list.shift
  s[cx][cy] == "." ? s[cx][cy] = "+" : next

  # 隣接マス(nx, ny)を調べる
  DIR.each do |dx, dy|
    nx = cx + dx
    ny = cy + dy

    # 塗れないならスキップ
    next if nx < 0 || n - 1 < nx || ny < 0 || m - 1 < ny
    next if s[nx][ny] != "."

    # 塗れるなら座標を追加
    search_list << [nx, ny]
  end
end

# 出力
puts s.map { |r| r.join }.join("\n")

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
ペイントソフトなどで使われているような塗りつぶしの処理を実装してみましょう。

白色のマス '.' または黒色のマス '#' から構成されている n × m のグリッドが与えられます。
ここで、グリッドの上から a 行目、左から b 列目のマスを、マス (a, b) と呼ぶことにします。
このグリッドの中で、(x, y) が含まれる、白色のマスからなる領域 (連結成分) の各マスを青色 '+' に置き換えて出力してください。

なお、連結成分とは、以下のような条件を満たすマスの集合のことをいいます。
・ 集合内のすべての 2 つのマスは、その集合に含まれる上下左右で隣接するマスへの移動を繰り返すことで行き来することができる。
・ 集合に含まれるすべてのマスは、同じ色である。
・ 集合に含まれないどのマスを追加しても、上のいずれかの条件を満たさなくなる。

▼　下記解答欄にコードを記入してみよう

入力される値
n m x y
s_1
s_2
...
s_n

・ 1 行目に、グリッドの行数を表す整数 n, グリッドの列数を表す整数 m, 塗りつぶす基準のマスの位置を表す整数 x, y が半角スペース区切りで与えられます。
・ 続く n 行では、グリッドの各行の各マスを表す文字列 s_i が改行区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
合計 n 行出力してください。

塗りつぶしを行ったあとの、n × m のグリッドを入力と同じように文字列の形式で n 行で出力してください。塗りつぶしたマスは '+' とすべきことに注意してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ n, m ≦ 1,000
・ 1 ≦ x ≦ n
・ 1 ≦ y ≦ m
・ n, m, x, y は整数
・ s_i は '.' または '#' からなる長さ m の文字列
・ マス (x, y) は白色のマスである (s_x_y = '.')

入力例1
3 3 1 1
..#
##.
...

出力例1
++#
##.
...
=end
