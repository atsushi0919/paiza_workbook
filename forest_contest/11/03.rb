# 素数判定 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_011/forest_contest_011__d_prime_number

n = gets.to_i

is_prime = n != 1 ? true : false
2.upto(n ** 0.5) do |i|
  if n % i == 0
    is_prime = false
    break
  end
end

puts is_prime ? "Yes" : "No"

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数nが与えられるので、素数かどうかを判定してください。
素数とは、自身と2以上の自然数のうち、自身と1だけでしか割り切れない数のことです。

▼　下記解答欄にコードを記入してみよう

入力される値
n

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
nが素数であるならば、"Yes"を、そうでいならば"No"を表示してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ n ≦ 100

入力例1
7

出力例1
Yes

入力例2
8

出力例2
No

入力例3
1

出力例3
No
=end