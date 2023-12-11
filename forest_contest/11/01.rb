# お菓子の合計金額 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_011/forest_contest_011__d_snack

INPUT1 = <<"EOS"
10 20
EOS
OUTPUT1 = <<"EOS"
30
EOS

p gets.split.map(&:to_i).sum

# puts gets.split.map(&:to_i).sum

=begin
2 種類のお菓子の値段はそれぞれ a, b 円です。2 種類のお菓子を 1 つずつ購入したときの合計金額を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
a b


・ 1 行目にお菓子の値段 a,b がそれぞれ整数で半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
2 種類のお菓子を 1 つずつ購入したときの合計金額を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ a, b ≦ 1000

入力例1
10 20

出力例1
30
=end
