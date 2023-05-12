# アルファベットの順番 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/alphabets_large_or_small_2

<<"EOS"

入力例1
GINO

出力例1
true

入力例2
CZ

出力例2
true

入力例3
VIOLIN

出力例3
false

EOS

# [解答例1]
# "A" から "Z" までの文字列
ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

s = gets.chomp
top_idx = ALPHABET.index(s[0])
end_idx = ALPHABET.index(s[-1])

if top_idx < end_idx
  puts "true"
else
  puts "false"
end

# [解答例2]
s = gets.chomp
top_chr = s[0]
end_chr = s[-1]

puts top_chr < end_chr ? "true" : "false"

=begin
アルファベットの順番 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/alphabets_large_or_small_2
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
英大文字の文字列が入力されます。
文字列の先頭1文字が、末尾1文字よりもアルファベット順で先に出現するならば、
"true"を出力し、そうでなければ"false"を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
1行の文字列が入力されます。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
"true"または"false"を出力してください。

条件
・最初のアルファベットは、最後のアルファベットと異なる文字
・文字列は半角英大文字で構成される
・1 ≦ (文字列の長さ) ≦10

入力例1
GINO

出力例1
true

入力例2
CZ

出力例2
true

入力例3
VIOLIN

出力例3
false
=end
