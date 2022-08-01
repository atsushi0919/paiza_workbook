# 文字列の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/alphabets_large_or_small_0

<<"EOS"

入力例1
kirishima
kuroda
rokumura

出力例1
kirishima
kuroda
rokumura

入力例2
tenshoku
shinsotsu
entry

出力例2
tenshoku
shinsotsu
entry

入力例3
Tokyo
Osaka
Nagoya

出力例3
Tokyo
Osaka
Nagoya

EOS

# [解答例1]
a = gets.chomp
b = gets.chomp
c = gets.chomp
puts a
puts b
puts c

# [解答例2]
N = 3
ary = N.times.map { gets.chomp }
puts ary

=begin

問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
3つの文字列が3行で入力されるので、入力された文字列をそのまま1行ずつ出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

A
B
C


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
入力された通りに出力してください。3行で入力されるので、出力も3行となります。
最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

A, B, C は、半角英数字からなる文字列
1 ≦ (文字列 A の長さ) ≦ 30
1 ≦ (文字列 B の長さ) ≦ 30
1 ≦ (文字列 C の長さ) ≦ 30

入力例1
kirishima
kuroda
rokumura

出力例1
kirishima
kuroda
rokumura

入力例2
tenshoku
shinsotsu
entry

出力例2
tenshoku
shinsotsu
entry

入力例3
Tokyo
Osaka
Nagoya

出力例3
Tokyo
Osaka
Nagoya
=end
