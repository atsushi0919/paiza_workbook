# 格子点
# https://paiza.jp/works/mondai/double_roop_problems/double_roop_problems__grid_point

p 1332

# m=0;(1..98).each{|x|(1..99-x).each{|y|m=[m,x*y].max if x**3+y**3<1e5}};p m

=begin
x + y < 100 かつ (x ^ 3) + (y ^ 3) < 100000 が成り立つような正の整数 x , y について x × y の最大値を求めてください。

・ ヒント
2 つの式を連立不等式として解きたくなりますが、x + y < 100 に注目すると、
(x , y) のとりうる値は (1,1) , (1,2) , (1,98) , (2,1)... (98,1) のいずれかであり、
これらは高々 98 + 97 + ... + 1 = 99 × 44 = 4356 通り（等差数列の和の公式を利用）であるため、全ての組を調べても実行時間制限に間に合います。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

なし

条件
出力される値
条件を満たす正の整数 x , y について x × y の最大値を 1 行で出力してください。
出力の末尾には改行を入れてください。

入力例

出力例

1332
=end