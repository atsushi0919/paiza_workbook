# 部分数列 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__before_after_step4

INPUT1 = <<~"EOS"
  1 1
  -53
  -53
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  3 1
  89 -17 -76
  28
EOS
OUTPUT2 = <<~"EOS"
  -1
EOS

input_lines = INPUT2.split("\n")
_, m = input_lines.shift.split.map(&:to_i)
a = input_lines.shift.split.map(&:to_i)
b = input_lines.shift.split.map(&:to_i)

matched_idx = -1
a.each_cons(m).with_index(1) do |nums, idx|
  if nums == b
    matched_idx = idx
    break
  end
end

puts matched_idx

=begin
 下記の問題をプログラミングしてみよう！
整数 n, m と、数列 a_1, ... , a_n と 数列 b_1, ... , b_m が与えられます。

下記の条件を満たす i を出力してください。
条件を満たす i が複数存在するときは、そのうちもっとも小さい i を出力してください。
条件を満たす i がひとつも存在しない場合は -1 を出力してください。

* 数列 a_i, ... , a_{i + m - 1 } が数列 b_1, ... , b_m と等しい

▼　下記解答欄にコードを記入してみよう

入力される値
n m
a_1 a_2 ... a_n
b_1 b_2 ... b_m


・ 1 行目に、各数列の長さを表す整数 n と m が与えられます。
・ 2 行目に、数列の値 a_i が半角スペース区切りで与えられます。
・ 3 行目に、数列の値 b_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
「数列 a_i, ... , a_{i + m - 1 } が数列 b_1, ... , b_m と等しい」という条件を満たす i を出力してください。
条件を満たす i が複数存在するときは、そのうちもっとも小さい i を出力してください。存在しない場合は -1 を出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ n ≦ 1,000
・ 1 ≦ m ≦ n
・ -100 ≦ a_i ≦ 100
・ -100 ≦ b_i ≦ 100

入力例1
1 1
-53
-53

出力例1
1

入力例2
3 1
89 -17 -76
28

出力例2
-1
=end
