# 卵の生産 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_009/forest_contest_009__d_egg

INPUT1 = <<"EOS"
3 271
EOS
OUTPUT1 = <<"EOS"
813
EOS

puts gets.split.map(&:to_i).inject(:*)

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
あるニワトリは 1 日に a 個の卵を産みます。n 日間でニワトリが何個卵を産むかを求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
a n


・ 1 行目に 1 日あたりにニワトリが産む卵の個数 a, 日数 n がそれぞれ整数で半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
n 日間でニワトリが産む卵の個数を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 0 ≦ a ≦ 100, 1 ≦ n ≦ 100

入力例1
3 271

出力例1
813
=end