# アルファベットの範囲の文字の出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/alphabets_large_or_small_1

<<"EOS"

入力例1
GINO

出力例1
G
H
I
J
K
L
M
N
O

入力例2
CZ

出力例2
C
D
E
F
G
H
I
J
K
L
M
N
O
P
Q
R
S
T
U
V
W
X
Y
Z

入力例3
JP

出力例3
J
K
L
M
N
O
P

EOS

# [解答例1]
# "A" から "Z" までの文字列
ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

s = gets.chomp
top_idx = ALPHABET.index(s[0])
end_idx = ALPHABET.index(s[-1])
(top_idx..end_idx).each do |idx|
  puts ALPHABET[idx]
end

# [解答例2]
s = gets.chomp
top_chr = s[0]
end_chr = s[-1]
puts (top_chr..end_chr).to_a

=begin
アルファベットの範囲の文字の出力 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/alphabets_large_or_small_1
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
英大文字の文字列が入力されます。
この文字列の先頭1文字と末尾1文字で表される範囲に含まれる文字をすべて出力してください。

範囲とは、アルファベット順に並べた英大文字の列('A', 'B', 'C', ..., 'Z')について、先頭の文字の出現位置から末尾の文字の出現位置までの部分列のことです。
たとえば、先頭の文字が'G'で末尾の文字が'O'で表される範囲は、('G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O')となります。

出力はアルファベット順に表示し、1文字表示するたびに改行してください。

▼　下記解答欄にコードを記入してみよう

入力される値
1行の文字列が入力されます。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
先頭の文字から末尾の文字までの間のアルファベットを、1文字ごとに改行して出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
・文字列の先頭の1文字は、末尾の1文字よりもアルファベット順で先に出現
・1 ≦ (文字列の長さ) ≦10

入力例1
GINO

出力例1
G
H
I
J
K
L
M
N
O

入力例2
CZ

出力例2
C
D
E
F
G
H
I
J
K
L
M
N
O
P
Q
R
S
T
U
V
W
X
Y
Z

入力例3
JP

出力例3
J
K
L
M
N
O
P
=end
