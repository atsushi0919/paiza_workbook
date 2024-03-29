# 目にやさしく (paizaランク A 相当)
# https://paiza.jp/works/mondai/bfs_dfs_problems_advanced/bfs_dfs_problems_advanced__merge

INPUT1 = <<"EOS"
3 3
RGG
BBG
BGB
EOS
OUTPUT1 = <<"EOS"
2
EOS

def count_connected_components(board)
  searched = "*"
  row = board.length
  col = board[0].length

  count = 0
  0.upto(row - 1) do |x|
    0.upto(col - 1) do |y|
      # 探索開始地点を探す
      next if board[x][y] == searched
      color = board[x][y]

      # 探索開始地点から連結成分を調べる
      count += 1
      search_list = [[x, y]]
      while search_list.length > 0
        cx, cy = search_list.shift
        next if board[cx][cy] == searched

        board[cx][cy] = searched
        DIR.each do |dx, dy|
          nx = cx + dx
          ny = cy + dy
          next if nx < 0 || row - 1 < nx || ny < 0 || col - 1 < ny
          next if board[nx][ny] != color

          search_list << [nx, ny]
        end
      end
    end
  end
  count
end

# 色設定
COLORS = %w[R G B]
# 方向設定 x↓ y→
DIR = [[-1, 0], [0, 1], [1, 0], [0, -1]]

# 入力
input_lines = $stdin.read.split("\n")
n, m = input_lines.shift.split.map(&:to_i)
s = input_lines.shift(n)

# 2 色に減色した盤面を生成する
repainted_boards = COLORS.combination(2).map { |a, b| s.map { |row| row.gsub(a, b) } }

# 生成した各盤面の連結成分数を数える
num_of_cc = repainted_boards.map { |board| count_connected_components(board) }

# 連結成分数の最小値を出力
puts num_of_cc.min

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
ここに、'R', 'G', 'B' (それぞれ赤、緑、青) で構成される n × m のグリッドで表される看板があります。
この看板を見た paiza 君は、カラフルすぎて少々目にやさしくないと感じたので、色を 2 色にすることにしました。
さらに、目によりやさしくなるように、グリッドに含まれる連結成分の個数ができるだけ少なくなるようにしたいと思いました。
以下のいずれかの操作を一度だけおこなってグリッドの色を 2 色にするとき、その連結成分の個数の最小値を求めてください。

・赤色のマスをすべて緑色にする
・赤色のマスをすべて青色にする
・緑色のマスをすべて赤色にする
・緑色のマスをすべて青色にする
・青色のマスをすべて赤色にする
・青色のマスをすべて緑色にする

なお、連結成分とは、以下のような条件を満たすマスの集合のことをいいます。
・ 集合内のすべての 2 つのマスは、その集合に含まれる上下左右で隣接するマスへの移動を繰り返すことで行き来することができる。
・ 集合に含まれるすべてのマスは、同じ色である。
・ 集合に含まれないどのマスを追加しても、上のいずれかの条件を満たさなくなる。

▼　下記解答欄にコードを記入してみよう

入力される値
n m
s_1
s_2
...
s_n

・ 1 行目に、グリッドの行数を表す整数 n, グリッドの列数を表す整数 m が半角スペース区切りで与えられます。
・ 続く n 行では、グリッドの各行の各マスを表す文字列 s_i が改行区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
答えの整数を 1 行に出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ n, m ≦ 1,000
・ n, m は整数
・ s_i は 'R', 'G', 'B' からなる長さ m の文字列

入力例1
3 3
RGG
BBG
BGB

出力例1
2
=end
