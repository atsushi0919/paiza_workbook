# 島探し (paizaランク S 相当)
# https://paiza.jp/works/mondai/skillcheck_sample/search-island

INPUT1 = <<~"EOS"
  4 5
  0 1 1 0
  1 0 1 0
  1 0 0 0
  0 0 1 1
  0 1 1 1
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  6 6
  1 1 1 1 1 1
  1 0 1 0 0 0
  1 0 1 0 1 1
  0 1 0 0 0 1
  1 0 1 1 1 1
  0 1 0 0 0 0
EOS
OUTPUT2 = <<~"EOS"
  5
EOS

class Field
  VY = [1, 0, -1, 0]
  VX = [0, 1, 0, -1]

  def initialize(h, w, field_data)
    @h = h
    @w = w
    @field_data = field_data
  end

  def count_island
    @memo = @field_data.map(&:dup)
    count = 0
    (0...@h).each do |y|
      (0...@w).each do |x|
        if @memo[y][x] == "1"
          island = dfs(y, x)
          count += 1
        end
      end
    end
    count
  end

  private

  def dfs(y, x)
    stack = [[y, x]]
    island = [[y, x]]
    while stack.size > 0
      y, x = stack.pop
      @memo[y][x] = "0"
      VY.zip(VX).each do |dy, dx|
        ny = y + dy
        nx = x + dx
        if 0 <= ny && ny < @h && 0 <= nx && nx < @w && @memo[ny][nx] == "1"
          stack.append([ny, nx])
          island.append([ny, nx])
        end
      end
    end
    return island
  end
end

def solve(input_str)
  input_lines = input_str.split("\n")
  w, h = input_lines.shift.split.map(&:to_i)
  field = Field.new(h, w, input_lines.map(&:split))
  field.count_island
end

puts solve(INPUT1)

=begin
島探し (paizaランク S 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/skillcheck_sample/search-island
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
列の数がM、行の数がNの表があります。表の各マスは白か黒で塗られています。
黒で塗られたマスが上下左右で隣接している時、その黒マスの塊をまとめて「島」と呼びます。
例えば、以下のような4列×5行の表（M=4、N=5）があった場合、



この表には以下の(1)～(3)のように3つの島が存在します。



島の数を計算して出力するプログラムを作成して下さい。

▼　下記解答欄にコードを記入してみよう

入力される値
1行目には、列の数Mと行の数Nがスペース区切りで入力されます。
2行目以降のN行には、スペース区切りでM個の数字が入力されます。 各行は'0'が白、'1'が黒のマスをそれぞれ表します。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
島の数を一行で出力して下さい。

条件
10個のテストケースの内、8個のテストケースにおいて以下の条件を満たします。
1 ≦ N,M ≦ 100

10個のテストケースの内、全てのテストケースにおいて以下の条件を満たします。
1 ≦ N,M ≦ 1,000

入力例1
4 5
0 1 1 0
1 0 1 0
1 0 0 0
0 0 1 1
0 1 1 1

出力例1
3

入力例2
6 6
1 1 1 1 1 1
1 0 1 0 0 0
1 0 1 0 1 1
0 1 0 0 0 1
1 0 1 1 1 1
0 1 0 0 0 0

出力例2
5
=end
