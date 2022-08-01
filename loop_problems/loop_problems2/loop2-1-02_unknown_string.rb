=begin
未知数個の文字列の受け取り (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/loop_problems2/loop_problems2__unknown_string
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
複数の文字列が入力されます。文字列の数はわかりません。
EOF が入力されるまで、受け取った文字列を改行区切りで出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
s_1 s_2 ... EOF


・ 複数の文字列が 1 行で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
EOF が入力されるまで、受け取った数を改行区切りで出力してください。
出力の末尾には改行を入れてください。


s_1
s_2
...
EOF
条件
すべてのテストケースにおいて、以下の条件をみたします。

・ s_i は数字または大文字・小文字のアルファベットからなる長さ 1 以上 10 以下の文字列

入力例1
abc def ghi jkl EOF

出力例1
abc
def
ghi
jkl
EOF

入力例2
as haj jsjda fj sklkf jklfjs s fhf sjhf EOF

出力例2
as
haj
jsjda
fj
sklkf
jklfjs
s
fhf
sjhf
EOF

入力例3
paiza 813 8iza iza8 81za EOF

出力例3
paiza
813
8iza
iza8
81za
EOF
=end