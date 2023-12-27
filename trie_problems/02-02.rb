# トライ木の文字列検索 (paizaランク B 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__array_search

INPUT1=<<"EOS"
4
0 a t
1 t r
2 r e
3 e e
4 e #
EOS
OUTPUT1=<<"EOS"
tree
EOS

INPUT2=<<"EOS"
5
5 d #
4 b d
3 c b
2 b c
1 a b
0 a a
EOS
OUTPUT2=<<"EOS"
abcbd
EOS

INPUT3=<<"EOS"
1
0 a f
1 f #
EOS
OUTPUT3=<<"EOS"
f
EOS

n,*a=`dd`.split($/).map &:split
t=[];a.each{|x,y,z|t[x.to_i]={y=>z}}
i=0;j=?a;while t[i][j]!=?#;$><<j=t[i][j];i+=1;end

=begin
長さ N の小文字のアルファベットの文字列 S が格納されたトライ木の有向グラフが与えられます。
グラフは二次元配列 trie を用いて表されています。trie は次のような配列です。

・ キーとして 0 以上の整数 X と文字 Y を取り, インデックスとして文字 Z を取ります。
・ S の i 文字目を S_i としたとき、1 ≦ i < N の範囲では trie[i][S_i] にはS_{i+1}が格納されています。
・ trie[0][a] にはS_1が格納されています。この要素がトライ木の根に対応します。
・ 出ていく有向辺を持たない頂点に対応する要素には # が格納されています。

つまり、trieによって表されているグラフは trie[X][Y] の要素が # でない文字 Z であるとき、
trie[X][Y] を始点、trie[X+1][Z] を終点とするラベル Z の有向辺を持ちます。そしてこのグラフの頂点の数は N+1 です。

入力として N+1 個の X, Y, Z の組が与えられます。trie に格納された文字列 S を取り出してください。
そのために、根にあたる頂点 trie[0][a] を移動の開始地点とし、進める辺があるならそれに沿って進む、
という動作を進める辺がない頂点に到達するまで繰り返してください。1 つの頂点から複数の辺が出ているような入力は与えられません。

例えば入力例１の場合、次の図のような "tree" が格納されたトライ木が与えられています。


▼　下記解答欄にコードを記入してみよう

入力される値
N
X_1 Y_1 Z_1
...
X_{N+1} Y_{N+1} Z_{N+1}


・1 行目に文字列の長さ N が与えられます。
・続く N 行に i 番目の入力 X_i, Y_i, Z_i が空白区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
文字列 S を 1 行で出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします。
・与えられるグラフは木です。
・1 ≦ N ≦ 100
・0 ≦ X_i ≦ N
・Y_i はアルファベット小文字
・Z_i はアルファベット小文字か #

入力例1
4
0 a t
1 t r
2 r e
3 e e
4 e #

出力例1
tree

入力例2
5
5 d #
4 b d
3 c b
2 b c
1 a b
0 a a

出力例2
abcbd

入力例3
1
0 a f
1 f #

出力例3
f
=end