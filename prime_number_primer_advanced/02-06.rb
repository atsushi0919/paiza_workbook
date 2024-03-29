# 完全数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__divisor_perfect_number

# 昇順で約数列挙
def enumrate_divisors(n)
  res = []
  (1..n ** 0.5).each do |i|
    if n % i == 0
      res << i
      res << n / i if i != n / i
    end
  end
  res.sort
end

# 入力
n = gets.to_i

# 約数列挙
divisors = enumrate_divisors(n)

# 完全数の判定結果を出力
puts divisors.sum / 2 == n ? "Yes" : "No"

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
整数 N が与えられるので、N が完全数かどうか判定してください。

完全数とは、ある整数 N の約数のうち、N を抜いた約数の和が N に等しくなる数のことを指します。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 N が与えられます。


N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
整数 N が完全数かどうか判定し、完全数なら "Yes"、完全数でないなら "No" を一行で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ N ≦ 10,000


入力例1
15

出力例1
No

入力例2
6

出力例2
Yes

入力例3
185

出力例3
No 
=end
