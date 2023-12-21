# 文字列の全削除 (paizaランク C 相当)
# https://paiza.jp/works/mondai/regular_expression/regular_expression__processing_6

puts`dd`.gsub /import [a-zA-Z0-9]+/,""

=begin
引き続き、正規表現を使って文字列を処理する方法について見ていきます。
今回は、文字列の全削除をおこないます。

文字列 S が与えられるので、正規表現を用いて、文字列 S において以下のパターンを検索し、マッチした部分をすべて削除した文字列を出力してください。

パターン: 文字列 import の後に 1 文字以上の半角英数字列が続く文字列

ただし、検索対象のパターンが複数回出現する場合は、最初に出現するものを繰り返し削除してください。
検索は最左最長一致でおこなってください。
また、文字列の先頭の位置を 0 として、各文字の位置を左から順に 0, 1, 2, ... とします。

▼　下記解答欄にコードを記入してみよう

入力される値
s

・ 1 行目に、検索対象の文字列 s が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
マッチした文字列をすべて削除した後の文字列を 1 行で出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。
検索は最左最短一致で行う必要があることに注意してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ S は ASCII 文字 (半角英数字記号) で構成される 1000 文字以下の文字列
・ S には、指定されたパターンが必ず 1 回以上出現する

入力例1
import sys/import os/import re

出力例1
//
=end