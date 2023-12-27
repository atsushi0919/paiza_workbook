# 最短一致と 0 回または 1 回の繰り返し (paizaランク C 相当)
# https://paiza.jp/works/mondai/regular_expression/regular_expression__advanced_1

puts`dd`=~/G[A-Z]*??C/,$&

=begin
正規表現の機能として、最短一致があります。最短一致とは、繰り返しに使われる ? + * {n,m} の後に ? を付けることで、
できるだけ短い文字列にマッチするようになる機能です。

ここでは、最も基本的な ?? の使い方を見ていきます。
? も ?? も直前の文字の 0 回または 1 回の出現を表しますが、? はできるだけその文字が出現する文字列にマッチするのに対し、
?? はできるだけ出現しないその文字が文字列にマッチしようとします。

例えば、paiza? という正規表現は、paiza という文字列が与えられたとき全体にマッチしますが、paiza?? という正規表現は、
同じ文字列が与えられると paiz という部分だけにマッチします。

文字列 S が与えられるので、正規表現を用いて、文字列 S において以下のパターンが何文字目から出現するかを求めてください。
また、そのパターンがマッチした文字列も出力してください。

パターン: 文字列 G の後に英大文字が 0 文字または 1 文字続き、その後に C が続く文字列、ただし 2 文字目の英大文字は可能な限り省略する

ただし、検索対象のパターンが複数回出現する場合は、最初に出現する位置と、マッチした文字列を出力してください。
検索は最左最短一致で行う必要があります。(長さが短いことよりも、位置が左側にあることを優先してください。)
また、文字列の先頭の位置を 0 として、各文字の位置を左から順に 0, 1, 2, ... とします。

▼　下記解答欄にコードを記入してみよう

入力される値
s

・ 1 行目に、検索対象の文字列 s が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
合計 2 行出力してください。
1 行目には、文字列 S において、パターンが最初に出現する位置を整数で出力してください。
2 行目には、マッチした文字列を出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。
検索は最左最短一致で行う必要があることに注意してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ S は ASCII 文字 (半角英数字記号) で構成される 1000 文字以下の文字列
・ S には、指定されたパターンが必ず 1 回以上出現する

入力例1
GCC

出力例1
0
GC
=end