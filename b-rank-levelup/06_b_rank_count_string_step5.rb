# 文字列の n 文字目と n + 1 文字目 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/count_string_4

<<"EOS"

入力例1
2
read

出力例1
e a

EOS

n = gets.to_i
s = gets.chomp
puts "#{s[n - 1]} #{s[n]}"

n = gets.to_i
s = gets.chomp
puts s.chars[n - 1..n].join(" ")

=begin
文字列の n 文字目と n + 1 文字目 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/count_string_4
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
文字列 s が入力されるので、n 文字目と n + 1 文字目を出力してください。 n + 1 文字目がない場合は何も出力しないでください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

n
s


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
n 文字目と n + 1 文字目を半角スペース区切りで出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≦ (文字列 s の長さ) ≦ 10,000
1 ≦ n ≦ 10,000
文字列sは、半角アルファベットで構成された文字列

入力例1
2
read

出力例1
e a
=end
