# 点と点の距離 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step4

INPUT1 = <<~"EOS"
  5
  -9 5
  0 4
  2 -6
  7 -4
  -3 -1
  10
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

def solve1(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary = input_lines.shift(n).map { |l| l.split.map(&:to_i) }
  k = input_lines.shift.to_i

  ax, ay = ary[n - 1]
  result = 0
  ary.each do |bx, by|
    dist = (ax - bx).abs + (ay - by).abs
    result += 1 if dist <= k
  end

  result
end

# puts solve1(STDIN.read)
puts solve1(INPUT1)
# > 3

def solve2(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary = input_lines.shift(n).map { |l| l.split.map(&:to_i) }
  k = input_lines.shift.to_i

  ax, ay = ary[n - 1]
  ary.count { |bx, by| (ax - bx).abs + (ay - by).abs <= k }
end

# puts solve2(STDIN.read)
puts solve2(INPUT1)
# > 3

=begin
点と点の距離 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step4
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 n と、二次元平面上の点 1 ~ n の座標 (x_1, y_1), ... , (x_n, y_n), 整数 k が与えられます。

n 個の点 (点 n 含む) のうち、点 n とのマンハッタン距離が k 以下であるような点の数を求めてください。

なお、この問題において、2点間のマンハッタン距離とは、2点の各座標の差の絶対値の総和を指します。
つまり、点 (x_i, y_i) と点 (x_j, y_j) のマンハッタン距離は、| x_i - x_j | + | y_i - y_j | です。

▼　下記解答欄にコードを記入してみよう

入力される値
n
x_1 y_1
x_2 y_2
...
x_n y_n
k

・ 1行目に、点の数を表す整数 n が与えられます。
・ 続く n 行のうち i 行目に、点 i の座標 x_i, y_i が半角スペース区切りで与えられます。
・ n+2 行目に、整数 k が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
点 n とのマンハッタン距離が k 以下であるような点の数を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力は全て整数
・ 1 ≦ n ≦ 10,000
・ -1,000 ≦ x_i, y_i ≦ 1,000
・ i ≠ j ならば (x_i, y_i) ≠ (x_j, y_j)
・ 1 ≦ k ≦ 2,000

入力例1
5
-9 5
0 4
2 -6
7 -4
-3 -1
10

出力例1
3
=end
