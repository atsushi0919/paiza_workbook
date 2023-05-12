# 文字列の分割 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/substring_upper_0

<<"EOS"

入力例1
Hello World

出力例1
Hello
World

入力例2
0 1

出力例2
0
1

入力例3
a b

出力例3
a
b

EOS

# [解答例1]
a, b = gets.split
puts a
puts b

# [解答例2]
ary = gets.split
puts ary

=begin
文字列の分割 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/substring_upper_0
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
文字列がスペース区切りで２つ入力されるので、スペースで分割し、2行で出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

a b


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
a
b

最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≦ 文字列 a の長さ ≦ 30
1 ≦ 文字列 b の長さ ≦ 30
a と b は半角英数字で構成された文字列です。

入力例1
Hello World

出力例1
Hello
World

入力例2
0 1

出力例2
0
1

入力例3
a b

出力例3
a
b
=end
