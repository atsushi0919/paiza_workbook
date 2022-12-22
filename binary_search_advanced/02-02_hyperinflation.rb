# ハイパーインフレーション (paizaランク B 相当)
# https://paiza.jp/works/mondai/binary_search_advanced/binary_search_advanced__hyperinflation

INPUT1 = <<~"EOS"
  2 1000
  2 100 1 150
  3 200 2 300
EOS
OUTPUT1 = <<~"EOS"
  183
EOS

input_lines = $stdin.read.split("\n")
n, k = input_lines.shift.split.map(&:to_i)
foods = input_lines.shift(n).map { |e| e.split.map(&:to_i) }

left = 1
right = 10 ** 12
while left < right - 1
  x = (left + right) / 2
  cost = foods.map do |a, b, c, d|
    [a * x + b, c * x + d].min
  end.sum
  if cost < k
    left = x
  else
    right = x
  end
end

puts left

=begin
あなたは、K 円お金を持っており、N 種類の食品をそれぞれ 1 つずつ買いそろえたいと考えています。
それぞれの食品には 2 種類の商品があり、i 番目の食品の x (x ≧ 1) 日目の価格はそれぞれ A_i x + B_i 円, C_i x + D_i 円です。
ハイパーインフレーションにより、その価格は常に上昇中です。
これらの食品は日持ちしないため、決めた日にすべての食品を買いそろえようと考えています。
合計 K 円以下の価格で買いそろえることができるのは、何日目まででしょうか。

▼ 下記解答欄にコードを記入してみよう

入力される値
N K
A_1 B_1 C_1 D_1
A_2 B_2 C_2 D_2
...
A_N B_N C_N D_N


・ 1 行目に、食品の種類数を表す整数 N, あなたの所持金を表す整数 K が半角スペース区切りで与えられます。
・ 続く N 行に、正整数の組 A_i, B_i, C_i, D_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
問題の答えを、1 行に整数で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ N ≦ 200,000 = 2 × 10^5
・ 2 ≦ K ≦ 1,000,000,000,000 = 10^12
・ 1 ≦ A_i, B_i, C_i, D_i ≦ 1,000,000 = 10^6
・ 1 日目は K 円以下ですべての食品を買いそろえることができる

入力例1
2 1000
2 100 1 150
3 200 2 300

出力例1
183
=end
