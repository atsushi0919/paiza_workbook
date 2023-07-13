# 素数大好き paiza くん 4 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__back_prime

require "prime"

# 入力
n = gets.to_i

# n から 2 まで 1 ずつ減らしながら素数かを調べる
prime_number = -1
n.downto(2) do |i|
  if Prime.prime?(i)
    # 素数ならその数を記録してループを抜ける
    prime_number = i
    break
  end
end

# n 以下の素数で最も大きいものを出力
puts prime_number

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
paiza 君は素数が大好きですが、どれが素数なのか判定することができません。

整数 N が与えられるので、paiza 君の代わりに N 以下の素数で最も大きいものを出力してください。

なお、「整数 N が素数である」とは「N が 1 でない、かつ N の約数が 1 と N のみしか存在しない」ことをいいます。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 N が与えられます。


N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
N 以下の素数で最も大きいものを求め、一行で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 2 ≦ N ≦ 1,000,000,000,000

入力例1
10

出力例1
7

入力例2
100

出力例2
97

入力例3
2

出力例3
2
=end