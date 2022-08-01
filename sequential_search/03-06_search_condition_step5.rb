# 長方形に含まれる点 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step5

INPUT1 = <<~"EOS"
  5
  -9 5
  0 4
  2 -6
  7 -4
  -3 -1
  -5 5
  -5 5
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

def solve1(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary = input_lines.shift(n).map { |l| l.split.map(&:to_i) }
  xs, xt = input_lines.shift.split.map(&:to_i)
  ys, yt = input_lines.shift.split.map(&:to_i)

  result = 0
  ary.each do |x, y|
    if xs <= x && x <= xt &&
       ys <= y && y <= yt
      result += 1
    end
  end

  result
end

# puts solve1(STDIN.read)
puts solve1(INPUT1)
# > 2

def solve2(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary = input_lines.shift(n).map { |l| l.split.map(&:to_i) }
  xs, xt = input_lines.shift.split.map(&:to_i)
  ys, yt = input_lines.shift.split.map(&:to_i)

  ary.count do |x, y|
    xs <= x && x <= xt &&
    ys <= y && y <= yt
  end
end

# puts solve2(STDIN.read)
puts solve2(INPUT1)
# > 2

=begin
長方形に含まれる点 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step5
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 n と、二次元平面上の点 1 ~ n の座標 (x_1, y_1), ... , (x_n, y_n), 整数 x_s, x_t, y_s, y_t が与えられます。

n 個の点のうち、(x_s, y_s), (x_s, y_t), (x_t, y_t), (x_t, y_s) の4頂点からなる長方形の内部に含まれている点の数を求めてください。
なお、長方形の辺上にある点は長方形に含まれているものとします。

▼　下記解答欄にコードを記入してみよう

入力される値
n
x_1 y_1
x_2 y_2
...
x_n y_n
x_s x_t
y_s y_t

・ 1行目に、点の数を表す整数 n が与えられます。
・ 続く n 行のうち i 行目に、点 i の座標 x_i, y_i が半角スペース区切りで与えられます。
・ n+2 行目に、長方形のパラメータ x_s と x_t が半角スペース区切りで与えられます。
・ n+3 行目に、長方形のパラメータ y_s と y_t が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
長方形の内部に含まれている点の数を求めてください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力は全て整数
・ 1 ≦ n ≦ 10,000
・ -1,000 ≦ x_i, y_i, x_s, x_t, y_s, y_t ≦ 1,000
・ i ≠ j ならば (x_i, y_i) ≠ (x_j, y_j)
・ x_s < x_t
・ y_s < y_t

入力例1
5
-9 5
0 4
2 -6
7 -4
-3 -1
-5 5
-5 5

出力例1
2
=end
