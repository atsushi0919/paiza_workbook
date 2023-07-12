# 最大公約数と最小公倍数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__double_common

INPUT1 = <<"EOS"
2
10
15
EOS
OUTPUT1 = <<"EOS"
5 30
EOS

INPUT2 = <<"EOS"
3
12
123
132
EOS
OUTPUT2 = <<"EOS"
3 5412
EOS

INPUT3 = <<"EOS"
5
12
45
78
96
63
EOS
OUTPUT3 = <<"EOS"
3 131040
EOS

def prime_factorization(n)
  factors = []
  i = 2
  while i <= n ** 0.5
    while n > i && n % i == 0
      factors << i
      n /= i
    end
    i += 1
  end
  factors << n
end

# _, *a = $stdin.read.split.map(&:to_i)
_, *a = INPUT3.split.map(&:to_i)

# a_i を素因数分解する
factors_list = a.map { |n| prime_factorization(n) }
p factors_list

# lcm, gcd を求める
lcm_factors = factors_list.inject(:&)
gcd_factors = factors_list
  .inject([]) { |r, f| (r + f) }
  .delete_if { |gf| lcm_factors.include? gf }.concat lcm_factors
lcm, gcd = [lcm_factors, gcd_factors].map { |f| f.inject(:*) }

p gcd_factors

# 出力
puts [lcm, gcd].join(" ")

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 N と N 個の整数 A_1, ..., A_N が与えられるので、A_1, ..., A_N の最大公約数と最小公倍数を求めてください。

最大公約数とは、複数個の整数に共通する約数のうち最大のものを指します。また、最小公倍数とは複数個の整数に共通する倍数のうち、最小のものを指します。



最大公約数と最小公倍数は、素数問題集 (https://paiza.jp/works/mondai/prime_number_primer/) で学んだ方法で解くこともできますし、今から説明するユークリッドの互除法を用いた方法でも解くことができます。


ある二つの数の最大公約数はユークリッドの互除法を用いて以下のような手順で求めることができます。

1. 一方が 0 なら終了

2. 小さい方で大きい方を割り、大きい方を余りで置き換える。

3. 1. が達成されるまで 2 を繰り返す。

4. 0 でない方の数が最大公約数である。

また、二つの数を A, B、最大公約数と最小公倍数をそれぞれ GCD, LCM とすると、これらの数には以下のような関係があります。

A × B = GCD × LCM

これを用いると、最小公倍数は

LCM = (A × B) / GCD

というふうに求めることができます。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 N が与えられます。

・ 2 行目以降に A_1, ..., A_N が N 行で与えられます。


N
A_1
...
A_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
整数 A_1, ..., A_N の最大公約数と最小公倍数を求め、最大公約数・最小公倍数の順に半角スペース区切りで出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ N ≦ 10

・ 1 ≦ A_i ≦ 100 (1 ≦ i ≦ N)

入力例1
2
10
15

出力例1
5 30

入力例2
3
12
123
132

出力例2
3 5412

入力例3
5
12
45
78
96
63

出力例3
3 131040
=end
