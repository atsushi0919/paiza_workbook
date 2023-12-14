# 気温2
# https://paiza.jp/works/mondai/forest_contest_007/forest_contest_007__temparature_2

INPUT1=<<"EOS"
5
-2 5 13 1 4
EOS
OUTPUT1=<<"EOS"
15
EOS

gets;p (eval gets.split.map(&:to_i).minmax*?-).abs

=begin
n 個の都市の平均気温がそれぞれ x_i 度で与えられます（1 ≦ i ≦ n)。平均気温が最も高い都市と最も低い都市の温度差を求めてください。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

n

x_1 ... x_n

・1 行目に、都市の数 n が入力されます。
・2 行目にそれぞれの都市の平均気温 x_i （1 ≦ i ≦ n)が半角スペース区切りで入力されます。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ n ≦ 100
・ -20 ≦ x_i ≦ 40

出力される値
平均気温が最も高い都市と最も低い都市の差を出力してください。

入力例

5
-2 5 13 1 4

出力例

15
=end