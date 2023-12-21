# キャプチャとその回避 (paizaランク C 相当)
# https://paiza.jp/works/mondai/regular_expression/regular_expression__advanced_5

puts`dd`.match(/(?:n|st|vac)ation([0-9a-zA-Z]+)/).to_a

=begin
パターン: 文字列 nation または station または vacation の後に 1 文字以上の半角英数字列が続くもの、
ただしそれぞれ ation やそれより前の部分は一切キャプチャしないようにし、
ation の後に続く 1 文字以上の半角英数字列のみをグループでキャプチャするようにする

今回は、基本文法のテーマで取り上げたグループについて見ていきます。
復習になりますが、グループは丸かっこ () で囲まれた部分を表し、その部分を 1 つのまとまりとして扱うことができます。

正規表現の使いかたのテーマで少し触れましたが、それぞれのグループには番号が自動的に割り当てられます。
ライブラリの関数などで検索を行うと、各番号をインデックスにして、グループにマッチした部分文字列を取得することができます。

グループの番号は、正規表現全体が 0, 丸かっこで囲まれた部分が左から順に 1, 2, ... と割り当てられます。
例えば、((ex)pr)ession という正規表現に対して expression という文字列がマッチしたとき、
グループ 0 は expression, グループ 1 は expr, グループ 2 は ex となります。なお、グループの順番は開きかっこが基準になります。
このように、各グループにマッチした部分文字列を取得できるしくみを、キャプチャと呼びます。

正規表現には、キャプチャを回避するようなグループを作成できる機能があります。
これは、丸かっこ () の代わりに、(?: と ) で囲むことで実現できます。
このようなグループは、キャプチャを行わず、グループ番号も割り当てられません。
例えば、(?:pre|post)fix という正規表現に対して prefix という文字列がマッチしたとき、グループ 0 は prefix になりますが、グループ 1 はありません。

文字列 S が与えられるので、正規表現を用いて、文字列 S において以下のパターンを検索し、
最初にマッチしたものの各グループの文字列をすべて順番に出力してください。


ただし、検索対象のパターンが複数回出現する場合は、最初に出現するものを出力してください。
検索は最左最長一致でおこなってください。

▼　下記解答欄にコードを記入してみよう

入力される値
s

・ 1 行目に、検索対象の文字列 s が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
文字列 S において、指定されたパターンが最初にマッチしたときの、各グループの文字列を出力してください。
各文字列は、グループ 0 から順に改行区切りで出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ S は ASCII 文字 (半角英数字記号) で構成される 1000 文字以下の文字列
・ S には、指定されたパターンが必ず 1 回以上出現する

入力例1
This is famous stationery brand in Japan.

出力例1
stationery
ery
=end