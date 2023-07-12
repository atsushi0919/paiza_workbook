# 足し算素数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__sum_prime

require "prime"

# 入力
abc = gets.split.map(&:to_i)

# [a, b, c] から 2 個選んで合計した数が素数かを判定する
prime = false
abc.combination(2).each do |x, y|
  # 素数があれば記録してループを抜ける
  if Prime.prime?(x + y)
    prime = true
    break
  end
end

# 出力
puts prime ? "Yes" : "No"

=begin
整数 A, B, C が与えられます。

この三つの整数のうち二つを選んで足した数のどれかが素数になるかどうか判定してください。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 A, B, C が与えられます。


A B C

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
整数 A, B, C のうち、二つを選んで足した数のどれか一つでも素数なら "Yes"、全て素数でないなら "No" を一行で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ A, B, C ≦ 1,000,000,000,000

入力例1
1 2 3

出力例1
Yes

入力例2
10 10 10

出力例2
No

入力例3
100 1 1

出力例3
Yes 
=end
