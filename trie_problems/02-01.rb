# トライ木の構築 (paizaランク B 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__array_construct

INPUT1=<<"EOS"
4 5
tree
0 a
1 t
2 r
3 e
4 e
EOS
OUTPUT1=<<"EOS"
t
r
e
e
#
EOS

INPUT2=<<"EOS"
7 10
poweeer
0 a
1 p
2 o
3 w
4 e
5 e
6 e
7 r
0 b
3 e
7 c
EOS
OUTPUT2=<<"EOS"
p
o
w
e
e
e
r
#
#
#
EOS

# ※ 入力例2: Q=10 に対して query_1~11 まで入力あり

n,q,s,*r=`dd`.split
t=[];c=?a;(0..n.to_i).each{|i|t<<=s[i]?{c=>s[i]}:{};c=s[i]}
q.to_i.times{i,j=r.shift 2;puts t[i.to_i][j]||?#}

=begin
このメニューではトライ木というデータ構造を実装します。トライ木は有向木の一種で主に文字列を記録するためのデータ構造です。
トライ木では頂点とラベル付き有向辺に文字を割り当てて文字列を記録します。
また、トライ木の根 (空白となっている頂点) からラベル付き有向辺をたどることで記録された文字列を取り出すことができます。
トライ木の基本的な操作である文字列の挿入・検索・削除は文字列の長さをMとして全てO(M)で行うことが出来ます。

トライ木は次のような特徴を持つデータ構造です。

・根から i 本の辺を通って進んだ頂点にはトライ木に記録された文字列の i 文字目が格納されています。
・根から i 本の辺を通って進んだ頂点は格納された文字列の長さ i のプレフィックスのいずれかに対応します。
・葉 (出ていく辺を持たない頂点) に対応する文字列は必ずトライ木に記録された要素です。
・葉でない頂点であってもトライ木に記録された要素に対応している場合があります。
・ある頂点 u からある頂点 v にラベル x の付いた辺が出ている場合、 x は u が対応する文字列の次の文字になります。
そして u の末尾に x を付け足した文字列は v が対応する文字列となります。


例えば、tree, time, paiza, pathの４つの文字列を持つトライ木は次の図のようになります。

まずは配列を用いた簡単なトライ木の実装を行います。
長さが N の小文字のアルファベットからなる文字列 S が 1 つ与えられます。
S から次のような配列 trie を作成してください。
・ trie はキーとして整数と文字の 2 つを取り、格納する値として文字を取ります。
・ キーとなる整数は 0~N 、 キーとなる文字はアルファベットの小文字 a~z を取ります。
・ 格納する値としてアルファベットの小文字 a~z を取ります。
・ S の i 文字目 (1 ≦ i < N) を S_i としたとき, trie[i][S_i] には S_{i+1} が格納されています。
・ trie[0][a] には S_1 が格納されているものとします。この要素がトライ木の根に対応します。
・ 上記の条件以外の要素には何も格納されていないことを示す文字として # を格納します。

その後、次のような Q 個のクエリが与えられます。
・0 以上の整数 X とアルファベットの小文字 Y が与えられるので trie[X][Y] の要素を出力してください。

例えば、与えられる文字列 S が "tree" の場合、配列 trie によって構成されるトライ木は次の図のようになります。


▼　下記解答欄にコードを記入してみよう

入力される値
N Q
S
query_1
...
query_Q


・ 1行目に N, Q が与えられます。続いて文字列 S が与えられ、その後に続く Q 行のクエリが与えられます。各クエリは
X Y
の形式で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i 行目では i 番目のクエリに対する出力を行ってください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします。

・1 ≦ N, Q ≦ 100
・0 ≦ X ≦ N
・Y はアルファベット小文字

入力例1
4 5
tree
0 a
1 t
2 r
3 e
4 e

出力例1
t
r
e
e
#

入力例2
7 10
poweeer
0 a
1 p
2 o
3 w
4 e
5 e
6 e
7 r
0 b
3 e
7 c

出力例2
p
o
w
e
e
e
r
#
#
#
=end
