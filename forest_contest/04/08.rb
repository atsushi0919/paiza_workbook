# いちばんお得 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_004/forest_contest_004__per_gram

# 解答例1
g1, p1 = gets.split.map(&:to_f)
g2, p2 = gets.split.map(&:to_f)

x1 = p1 / g1
x2 = p2 / g2

puts x1 < x2 ? 1 : 2

# 解答例2
price_per_grams = []
$stdin.read.split("\n").each.with_index(1) do |c, i|
  gram, price = c.split.map(&:to_f)
  price_per_grams << { number: i, price_per_gram: price / gram }
end

puts price_per_grams.sort_by { |c| c[:price_per_gram] }.first[:number]

=begin

問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
あなたはスーパーにチョコを買いにきました。スーパーには 2 種類のチョコ (チョコ 1、チョコ 2) が置いてあり、それぞれ重さが g_1, g_2 グラム、値段が p_1, p_2 円です。

グラムあたりの値段が安いチョコを求めてください。

ただし、g グラム p 円のチョコのグラムあたりの値段は p/g 円です。

チョコ 1 とチョコ 2 のグラムあたりの値段は異なっていることが保証されます。

▼　下記解答欄にコードを記入してみよう

入力される値
g_1 p_1
g_2 p_2

・ 1 行目に、チョコ 1 の重さ g_1 と値段 p_1 が半角スペース区切りで整数で与えられます。
・ 2 行目に、チョコ 2 の重さ g_2 と値段 p_2 が半角スペース区切りで整数で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
グラムあたりの値段が安い方のチョコを求め、チョコの番号 (1 か 2) を 1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 100 ≦ g_i ≦ 1000
・ 100 ≦ p_i ≦ 3000
・ p_1/g_1 != p_2/g_2

入力例1
100 198
850 1728

出力例1
1
=end
