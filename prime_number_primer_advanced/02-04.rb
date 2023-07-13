# 約数列挙 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__divisor_show

# 入力
n = gets.to_i

# 約数列挙
res = []
(1..n ** 0.5).each do |i|
  if n % i == 0
    res << i
    res << n / i if i != n / i
  end
end

# n の約数を昇順で出力
puts res.sort

=begin
整数 N が与えられるので、N の約数を全て列挙してください。

また、約数は昇順で出力してください。

整数 N の約数とは、N を割り切る整数のことを指します。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 N が与えられます。


N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
整数 N の約数を全て求め、改行区切りで出力してください。

また、約数は昇順で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ N ≦ 100,000

入力例1
10

出力例1
1
2
5
10

入力例2
7

出力例2
1
7

入力例3
360

出力例3
1
2
3
4
5
6
8
9
10
12
15
18
20
24
30
36
40
45
60
72
90
120
180
360
=end