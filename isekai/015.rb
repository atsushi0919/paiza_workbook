# 卵 区間和

INPUT1 = <<"EOS"
4 2
5 3 8 2
EOS

OUTPUT1 = <<"EOS"
11
EOS

n, k, *a = $stdin.read.split.map(&:to_i)

s = [0]
a.each { |a_i| s << s[-1] + a_i }

ans = -1
k.upto(n) { |i| ans = [ans, s[i] - s[i - k]].max }

puts ans

=begin
n 日間で i 日目に a_i 個 (1 ≦ i ≦ n) の卵を産むニワトリがいます。ここで連続した k 日間 (k ≦ n) ニワトリから卵を貰える権利が与えられるとき、
卵を貰う開始日を適切に選んで貰える卵の個数を最大化した値を求めてください。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

n k

a_1 ... a_n
・ 1 行目に 日数 n, k がそれぞれ整数で半角スペース区切りで与えられます。
・ 2 行目に産んだ卵の個数 a_i (1 ≦ i ≦ n)が整数で半角スペース区切りで与えられます。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ k ≦ n ≦ 100
・ 0 ≦ a_i ≦ 100

出力される値
k 日間でニワトリから貰える卵の最大の個数を出力してください。

入力例

4 2
5 3 8 2

出力例

11
=end
