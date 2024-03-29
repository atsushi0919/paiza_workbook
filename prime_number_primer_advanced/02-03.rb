# 素因数カウント (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__factorization_count

# 入力
n = gets.to_i

# 素因数分解
factors = Hash.new(0)
i = 2
while i <= n ** 0.5
  while n > i && n % i == 0
    factors[i] += 1
    n /= i
  end
  i += 1
end
factors[n] += 1

# 第1キー: value, 第2キー: key で降順ソートしたリストに変換
sorted_factors = factors.sort_by { |k, v| [-v, -k] }

# 最も多く現れ、その素因数の中で最も大きいものを出力
puts sorted_factors[0][0]

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 N が与えられるので、N を素因数分解したときに最も多く現われる素因数を出力してください。

素因数分解とは、ある整数を素数の積の形で表現することをいいます。
例として、18 を素因数分解すると 2 × 3 × 3、13 を素因数分解すると 13、27 を素因数分解すると 3 × 3 × 3 となります。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 N が与えられます。


N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
整数 N を素因数分解し、最も多く現われる素因数を求め、一行で出力してください。

最も多く現れる素因数が複数ある場合は、その素因数の中で最も大きいものを出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ N ≦ 1,000,000

入力例1
360

出力例1
2

入力例2
150

出力例2
5

入力例3
128

出力例3
2 
=end
