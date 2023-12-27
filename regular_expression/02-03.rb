# 文字列の置換 (paizaランク C 相当)
# https://paiza.jp/works/mondai/regular_expression/regular_expression__processing_3

puts`dd`.sub(/\d{2}\.\d{2}/){$&.sub ?.,?/}

=begin
パターン: 2 文字の半角数字列の後に、半角記号 . が続き、その後に 2 文字の半角数字列が続く文字列

引き続き、正規表現を使って文字列を処理する方法について見ていきます。
今回は、文字列の置換をおこないます。

文字列 S が与えられるので、正規表現を用いて、文字列 S において以下のパターンを検索し、最初にマッチした文字列を以下の通りに置き換えて出力してください。

パターン: 2 文字の半角数字列の後に、半角記号 . が続き、その後に 2 文字の半角数字列が続く文字列
置換後: その文字列の半角記号 . を半角記号 / に置き換えた文字列

ただし、検索対象のパターンが複数回出現する場合は、最初に出現するものを置き換えてください。
検索は最左最長一致でおこなってください。
また、文字列の先頭の位置を 0 として、各文字の位置を左から順に 0, 1, 2, ... とします。

ヒント：
正規表現において丸括弧 () で囲まれた部分はグループと呼ばれ、左から順番に \1, \2, ... という形で置換後の正規表現で参照することができます。

▼　下記解答欄にコードを記入してみよう

入力される値
s

・ 1 行目に、検索対象の文字列 s が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
置換後の文字列を 1 行で出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。
検索は最左最短一致で行う必要があることに注意してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ S は ASCII 文字 (半角英数字記号) で構成される 1000 文字以下の文字列
・ S には、指定されたパターンが必ず 1 回以上出現する

入力例1
12.01/1900 12.02/1900

出力例1
12/01/1900 12.02/1900
=end