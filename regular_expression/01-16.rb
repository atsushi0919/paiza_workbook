# グループを用いた繰り返しの検索 (paizaランク C 相当)
# https://paiza.jp/works/mondai/regular_expression/regular_expression__expression_16

p`dd`=~/(%[a-zA-Z0-9]{2}){2,}/

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
今回は新しい正規表現のルールはありませんが、前回のルールを応用して、少し複雑な検索を行ってみましょう。

グループを利用して、繰り返しなどと組み合わせることで、さまざまな検索を表現することができます。
例えば、(plz)+ という正規表現は、plz の 1 回以上の繰り返しを表し、plz, plzplz, plzplzplz などにマッチします。

文字列 S が与えられるので、正規表現を用いて、文字列 S において以下のパターンが何文字目から出現するかを求めてください。

パターン: 「記号 % の後に 2 桁の半角英数字が続くパターン」が 2 回以上繰り返される文字列

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
%20 %E3%83%91%E3%82%A4%E3%82%B6

出力例1
4
=end