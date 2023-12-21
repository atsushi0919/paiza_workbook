# 否定先読み (paizaランク C 相当)
# https://paiza.jp/works/mondai/regular_expression/regular_expression__advanced_7

puts`dd`=~/Java(?!Script)/,$&

=begin
パターン: 文字列 Java, ただし後ろに文字列 Script が続かないもの、また文字列 Java の部分だけをマッチさせる

引き続き先読み・後読みについて見ていきます。

ここでは、否定先読みについて紹介します。否定先読みをすることで、指定した文字列が続くものを除外することができます。

否定先読みは、正規表現の中で文字列を (?! と ) で囲むことで行います。具体例を見てみましょう。
例えば、そろばん(?!ど) という正規表現は、そろばんで という文字列の そろばん の部分にはマッチしますが、
そろばんど という文字列の そろばん の部分にはマッチしません。

つまり、否定先読みは、後ろに指定した文字列が続かないという条件を課しつつ、その部分はマッチさせないというようなことを実現できます。

文字列 S が与えられるので、正規表現を用いて、文字列 S において以下のパターンを検索し、
最初にマッチした文字列の位置と、そのパターンにマッチした文字列を出力してください。

パターン: 文字列 Java, ただし後ろに文字列 Script が続かないもの、また文字列 Java の部分だけをマッチさせる

ただし、検索対象のパターンが複数回出現する場合は、最初に出現する位置を出力してください。
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

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ S は ASCII 文字 (半角英数字記号) で構成される 1000 文字以下の文字列
・ S には、指定されたパターンが必ず 1 回以上出現する

入力例1
I'm good at JavaScript, but I'm not good at Java.

出力例1
44
Java
=end