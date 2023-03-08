# 寒暖差 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_004/forest_contest_004__tempdiff

# 解答例1
a = n.times.map { gets.to_i }
n = a.length

temp_diff = false
0.upto(n - 2) do |i|
  if (a[i] - a[i + 1]).abs >= 3
    temp_diff = true
    break
  end
end

puts temp_diff ? "Yes" : "No"

# 解答例2
a = $stdin.read.split.map(&:to_i)

temp_diff = false
a.each_cons(2) do |x, y|
  if (x - y).abs >= 3
    temp_diff = true
    break
  end
end

puts temp_diff ? "Yes" : "No"

=begin

問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
連続する 2 日間の最高気温の差が 3 度以上あるとき、「寒暖差がある」と呼ぶことにします。

10 日分の最高気温のデータが与えられるので、この中に寒暖差がある日が存在するかどうかを調べてください。

▼　下記解答欄にコードを記入してみよう

入力される値
a_1
a_2
...
a_10

・ i (1 ≦ i ≦ 10) 行目に、i 日目の最高気温を表す整数 a_i が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
寒暖差がある日が存在するなら Yes と、存在しないなら No と 1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 10 ≦ a_i ≦ 35

入力例1
27
28
29
29
28
30
25
26
28
30

出力例1
Yes
=end
