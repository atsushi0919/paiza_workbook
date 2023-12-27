# プレフィックスの列挙 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__enumrate_prefix_002

INPUT1=<<"EOS"
2
apple
apply
EOS

INPUT2=<<"EOS"
3
abc
def
ghi
EOS

puts`dd`.split[1..].map{|s|(1..s.size).map{|i|s[0,i]}}.flatten.uniq.sort

=begin
N 個のアルファベット小文字の文字列 S_1, ..., S_N が与えられます。
それらのプレフィックスのうち長さ 1 以上のものから重複を取り除いたものを辞書順に全て列挙してください。
辞書順とは、辞書に出てくる順番のことで、たとえば abc, aaa, acb, abd の 4 つを辞書順に並び替えると aaa, abc, abd, acb の順になります。

▼　下記解答欄にコードを記入してみよう

入力される値
N
S_1
...
S_N


・1 行目では文字列の個数N が与えられます。
・続くN行のうち、 i 行目では、i 番目の文字列 S_i が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
与えられた文字列のプレフィックスを改行区切りで辞書順に出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします

・1 ≦ N ≦ 100
・1 ≦ |S_i| ≦ 100 (|S_i| は、S_i の文字数です。)

入力例1
2
apple
apply

出力例1
a
ap
app
appl
apple
apply

入力例2
3
abc
def
ghi

出力例2
a
ab
abc
d
de
def
g
gh
ghi
=end