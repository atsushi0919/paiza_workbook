# 2 次元のハッシュテーブルを使おう (paizaランク B 相当)
# https://paiza.jp/works/mondai/hash_advanced/hash_advanced__two_dimention

INPUT1 = <<"EOS"
3 2 10 5
17 777 137
188 265 63
0 0
7 3
EOS
OUTPUT1 = <<"EOS"
-1
137 63
EOS

INPUT2 = <<"EOS"
10 5 15 10
95661 9666 89652 43280 61885 73376 13200 46373 56908 41445
80071 83942 26802 72421 62523 58025 68335 34144 8164 71920
14 0
1 6
0 0
9 7
8 4
EOS
OUTPUT2 = <<"EOS"
-1
-1
41445 71920
-1
46373 34144
EOS

# x のハッシュ値を返す
def hash_x(x)
  x % A
end

# y のハッシュ値を返す
def hash_y(y)
  y % B
end

# 入力
# input_lines = $stdin.read.split("\n")
input_lines = INPUT2.split("\n")
_, _, A, B = input_lines.shift.split.map(&:to_i)
x, y = input_lines.shift(2).map { |r| r.split.map(&:to_i) }
pq = input_lines.map { |r| r.split.map(&:to_i) }

# テーブル初期化
table = Array.new(A) { Array.new(B) { [] } }
# データ格納
x.zip(y).each { |xi, yi| table[hash_x(xi)][hash_y(yi)] << [xi, yi] }

# p 行 q 列目のデータを出力
pq.each do |pi, qi|
  puts table[pi][qi].length > 0 ? table[pi][qi].last.join(" ") : -1
end

=begin
今までは 1 つのハッシュ値をキーとしてハッシュテーブルを作成していましたが、
今回は入力から 2 種類のハッシュ値を計算し、2 次元のハッシュテーブルを作成してみましょう。

N 個の点の X 座標を表す数列 X_1, X_2, ..., X_N と Y 座標を表す数列 Y_1, Y_2, ..., Y_N が与えられます。
(X_i, Y_i) (1 ≦ i ≦ N) が点 i の座標を表します。
入力で与えられる整数 A と B を用いたハッシュ関数 Hx(X) = X % A と Hy(Y) = Y % B を用いて、
この N 個の座標データを 2 次元のハッシュテーブルに格納してください。
ハッシュテーブルは A × B の 2 次元配列とし、配列の各要素にはデータのリストを格納することとします。
なお、各要素の初期値は空リストとします。
また、このハッシュテーブルにはチェイン法を採用し、各リストに複数のデータが含まれる場合は、
格納した順番にデータが並ぶように実装してください。

その後、M 個の整数の組 (p_j, q_j) (1 ≦ j ≦ M)が与えられます。
ハッシュテーブルの p_j 行目の q_j 列目のリストにデータが存在するなら、最後にそのリストに追加されたデータを出力し、
データが存在しないなら -1 を出力してください。

入力例 1 を用いてハッシュテーブルの動きを説明します。A = 10、B = 5 です。

最初に格納するデータは (17,188) です。
X 座標のハッシュ値は 17 % 10 = 7、Y 座標のハッシュ値は 188 % 5 = 3 であるので、
7 行目の 3 列目の位置にあるリストにデータ (17,188) を格納します。リストは [(17,188)] となります。

次に格納するデータは (777, 265) で X 座標のハッシュ値は 7、Y 座標のハッシュ値は 0 となるので、7 行目の 0 列目の位置にあるリストにデータ (777, 265) を格納します。リストは [(777,265)] となります。

次に格納するデータは (137, 63) で X 座標のハッシュ値は 7、Y 座標のハッシュ値は 3 となるので、7 行目の 3 列目の位置にあるリストにデータ (137, 63) を格納します。リストは [(17,188),(137,63)] となります。

以上で全データの格納が終了しました。ハッシュテーブルの状態は、

[[],[],[],[],[]]
[[],[],[],[],[]]
[[],[],[],[],[]]
[[],[],[],[],[]]
[[],[],[],[],[]]
[[],[],[],[],[]]
[[],[],[],[],[]]
[[(777,265)],[],[],[(17,188),(137,63)],[]]
[[],[],[],[],[]]
[[],[],[],[],[]]
[[],[],[],[],[]]

となります。

よって、0 行目の 0 列目のリストにはデータが存在しないので -1 と出力し、7 行目の 3 行目のリストにはデータが存在するので、最後に追加されたデータである 137 63 を出力します。
▼　下記解答欄にコードを記入してみよう

入力される値
N M A B
X_1 X_2 ... X_N
Y_1 Y_2 ... Y_N
p_1 q_1
p_2 q_2
...
p_M q_M

1 行目に点の個数を表す整数 N と調べる整数の組の個数を表す整数 M と ハッシュ関数で用いる整数 A と B が与えられます。

2 行目に点の X 座標を表す長さ N の整数列が与えられます。

3 行目に点の Y 座標を表す長さ N の整数列が与えられます。

3 + j 行目に調べる整数の組 p_j と q_j が与えられます。(1 ≦ j ≦ M)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
M 行出力してください。j (1 ≦ j ≦ M) 行目には、ハッシュテーブルの p_j 行目の q_j 列目のリストにデータが存在するなら、最後にそのリストに追加されたデータの X, Y を半角スペース区切りで出力してください。データが存在しないなら -1 を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。


1 ≦ N ≦ 5000

1 ≦ M ≦ 5000

10 ≦ A ≦ 100

5 ≦ B ≦ 100

1 ≦ X_i, Y_i ≦ 100,000 (1 ≦ i ≦ N)

0 ≦ p_j ≦ A-1 (1 ≦ j ≦ M)

0 ≦ q_j ≦ B-1 (1 ≦ j ≦ M)
入力例1
3 2 10 5
17 777 137
188 265 63
0 0
7 3

出力例1
-1
137 63

入力例2
10 5 15 10
95661 9666 89652 43280 61885 73376 13200 46373 56908 41445
80071 83942 26802 72421 62523 58025 68335 34144 8164 71920
14 0
1 6
0 0
9 7
8 4

出力例2
-1
-1
41445 71920
-1
46373 34144
=end