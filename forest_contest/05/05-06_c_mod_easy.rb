# 条件を満たす最小の整数 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_mod_easy

x, y, z = gets.split.map(&:to_i)

while true
  break if x % y == z
  x += 1
end

puts x

=begin
条件を満たす最小の整数 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_mod_easy
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
x 以上であって、y で割った余りが z であるような整数のうち、最小のものを求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
x y z

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
答えの整数を 1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 1 ≦ x, y, z ≦ 1,000,000
・ 0 ≦ z < y

入力例1
11 7 2

出力例1
16
=end
