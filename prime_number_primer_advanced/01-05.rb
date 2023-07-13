# ニア素数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__near_prime

require "prime"

# 入力
n = gets.to_i

# ニア素数の判定
near_prime = if Prime.prime?(n)
    # n が素数ならニア素数でない
    false
  elsif Prime.prime?(n - 1) || Prime.prime?(n + 1)
    # n-1 か n+1 が素数ならニア素数
    true
  else
    # n-1 と n+1 が素数でないならニア素数でない
    false
  end

# ニア素数の判定結果を出力
puts near_prime ? "Yes" : "No"

=begin
素数より 1 大きい（または小さい）数を「ニア素数」とします。

整数 N が与えられるので、N がニア素数かどうか判定してください。

ただし、N が素数である場合、N はニア素数ではありません。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 N が与えられます。


N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
整数 N がニア素数かどうか判定し、ニア素数なら "Yes"、ニア素数でないなら "No" を一行で出力してください。

ただし、N が素数である場合、N はニア素数ではありません。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ N ≦ 1,000,000,000,000

入力例1
10

出力例1
Yes

入力例2
3

出力例2
No

入力例3
13

出力例3
No
=end
