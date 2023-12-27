# プレフィックスの列挙 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__enumrate_prefix_001

puts (1..gets.chomp.size).map{|i|$_[0,i]}

=begin
アルファベット小文字の文字列 S が与えられます。S の長さ 1 以上のプレフィックスを全て列挙してください。
ある文字列のプレフィックスとは、その文字列の先頭から始まる連続部分文字列のことを指します。
例えば、文字列 "apple" のプレフィックスは "", "a", "ap", "app", "appl", "apple" の 6 つです。
このうち、長さが 0 の "" を除く 5 つを出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
S

・ 文字列 S が 1 行で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
与えられた文字列のプレフィックスを改行区切りで長さの小さい順に出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします

・1 ≦ |S| ≦ 10^4 (|S|は、Sの文字数です。)

入力例1
apple

出力例1
a
ap
app
appl
apple

入力例2
prefix

出力例2
p
pr
pre
pref
prefi
prefix
=end