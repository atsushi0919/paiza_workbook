# 0 回または 1 回の出現の検索 (paizaランク C 相当)
# https://paiza.jp/works/mondai/regular_expression/regular_expression__expression_7

p`dd`=~/clang-?format/

=begin
パターン: 文字列 clangformat または clang-format

引き続き正規表現のルールを見ていきましょう。ここからは、文字列の繰り返しについて学びます。

〈正規表現のルール 7.〉クエスチョンマーク ? は、直前の文字の 0 回または 1 回の出現を表す

クエスチョンマーク ? は、直前の文字が 0 回または 1 回出現することを表します。つまり、直前の文字があってもなくても良いようなパターンを表します。

例えば、pea?rl という正規表現は、pearl または perl の文字列にあてはまります。
ピリオドや角かっこなどと組み合わせることもでき、[大中]?トロ という正規表現は、トロ や 中トロ、大トロ にマッチします。

文字列 S が与えられるので、正規表現を用いて、文字列 S において以下のパターンが何文字目から出現するかを求めてください。


ただし、検索対象のパターンが複数回出現する場合は、最初に出現する位置を出力してください。
また、文字列の先頭の位置を 0 として、各文字の位置を左から順に 0, 1, 2, ... とします。

▼　下記解答欄にコードを記入してみよう

入力される値
s

・ 1 行目に、検索対象の文字列 s が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
文字列 S において、パターンが最初に出現する位置を整数で 1 行で出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ S は ASCII 文字 (半角英数字記号) で構成される 1000 文字以下の文字列
・ S には、指定されたパターンが必ず 1 回以上出現する

入力例1
prettier autopep8 clang-format

出力例1
18
=end