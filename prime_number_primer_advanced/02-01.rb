# 素因数分解 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__prime_factorization

# 入力
n = gets.to_i

# 素因数分解
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

# 因数分解した結果を出力
puts factors

=begin
整数 N が与えられるので、N を素因数分解した結果を出力してください。

素因数分解とは、ある整数を素数の積の形で表現することをいいます。
例として、18 を素因数分解すると 2 × 3 × 3、13 を素因数分解すると 13、27 を素因数分解すると 3 × 3 × 3 となります。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 N が与えられます。


N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
整数 N を素因数分解し、小さい素数から順に改行区切りで出力してください。

同じ素数が複数現われる場合は、現われた回数だけその素数を出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ N ≦ 100,000

入力例1
10

出力例1
2
5

入力例2
12

出力例2
2
2
3

入力例3
13

出力例3
13
=end