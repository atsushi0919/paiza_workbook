# 気温2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_007/forest_contest_007__temparature_2

INPUT1 = """\
5
-2 5 13 1 4"""
OUTPUT1 = "15"

INPUT2 = """\
3
-20 0 40"""
OUTPUT2 = "60"

# 最大の差 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_largest_diff

n, *x = map(int, open(0).read().strip().split())

puts max(x) - min(x)

'''
# 解答例1-1
n = 5
a = n.times.map { gets.to_i }

# 0 ≦ m_i ≦ 100
max_sc = -1
min_sc = 101
a.each do |sc|
  max_sc = [max_sc, sc].max
  min_sc = [min_sc, sc].min
end

puts max_sc - min_sc

# 解答例1-2
a = $stdin.read.split.map(&:to_i)

min_sc, max_sc = a.minmax

puts max_sc - min_sc



n 個の都市の平均気温がそれぞれ x_i 度で与えられます（1 ≦ i ≦ n)。
平均気温が最も高い都市と最も低い都市の温度差を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
x_1 ... x_n


・1 行目に、都市の数 n が入力されます。
・2 行目にそれぞれの都市の平均気温 x_i （1 ≦ i ≦ n)が半角スペース区切りで入力されます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
平均気温が最も高い都市と最も低い都市の差を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ n ≦ 100
・ -20 ≦ x_i ≦ 40

入力例1
5
-2 5 13 1 4

出力例1
15

入力例2
3
-20 0 40

出力例2
60
'''
