# 文字数カウント (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_008/forest_contest_008__word_count

INPUT1 = <<"EOS"
forest
EOS

OUTPUT1 = <<"EOS"
6
EOS

INPUT2 = <<"EOS"
paiza
EOS

OUTPUT2 = <<"EOS"
5
EOS

# # 解答例1
# m = gets.chomp

# i = 0
# while m[i]
#   i += 1
# end

# puts i

# # 解答例2
# puts gets.chomp.length

=begin

問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
単語が一つ与えられるので、文字数を求めてください。（例えば、「paiza」の場合は 5 文字としてカウントします。）

▼　下記解答欄にコードを記入してみよう

入力される値
m


・ 1 行目に単語 m が文字列として入力されます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
文字数を 1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・　 1 ≦ m の長さ ≦ 100
・　 m は英大文字・英小文字・数字からなる文字列

入力例1
forest

出力例1
6

入力例2
paiza

出力例2
5
=end
