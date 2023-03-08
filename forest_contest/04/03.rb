# 四季 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_004/forest_contest_004__four_seasons

INPUT1 = <<"EOS"
1
EOS

OUTPUT1 = <<"EOS"
winter
EOS

# 解答例1-1
m = gets.to_i

res = if m < 3 || m == 12
    "winter"
  elsif m < 6
    "spring"
  elsif m < 9
    "summer"
  elsif m < 12
    "autumn"
  end

puts res

# 解答例1-2
m = gets.to_i

res = if [3, 4, 5].include?(m)
    "spring"
  elsif [6, 7, 8].include?(m)
    "summer"
  elsif [9, 10, 11].include?(m)
    "autumn"
  elsif [12, 1, 2].include?(m)
    "winter"
  end

puts res

# 解答例1-3
m = gets.to_i

res = case m
  when 3, 4, 5
    "spring"
  when 6, 7, 8
    "summer"
  when 9, 10, 11
    "autumn"
  when 12, 1, 2
    "winter"
  end

puts res

=begin
 
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
気象庁は、季節を表す用語を以下のように定めています。

・ 春 ： 3 ~ 5 月の期間
・ 夏 ： 6 ~ 8 月の期間
・ 秋 ： 9 ~ 11 月の期間
・ 冬 ： 12 ~ 2 月の期間

1 以上 12 以下の整数 m が与えられます。m 月の季節を求めてください。
ただし、プログラム上では春を spring、夏を summer、秋を autumn、冬を winter で表すことにします。

▼　下記解答欄にコードを記入してみよう

入力される値
m

・ 1 行目に、月を表す整数 m が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
m 月の季節を求め、1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 1 ≦ m ≦ 12

入力例1
1

出力例1
winter
=end
