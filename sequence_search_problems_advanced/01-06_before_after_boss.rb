# 部分列 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__before_after_boss

INPUT1 = <<~"EOS"
  7 7
  -20 -85 -48 97 -86 83 -11
  85 22 49 -88 -2 -31 -92
EOS
OUTPUT1 = <<~"EOS"
  No
EOS

INPUT2 = <<~"EOS"
  2 2
  -30 97
  -30 97
EOS
OUTPUT2 = <<~"EOS"
  Yes
EOS

INPUT3 = <<~"EOS"
  1 1
  -69
  -19
EOS
OUTPUT3 = <<~"EOS"
  No
EOS

input_lines = INPUT3.split("\n")
_, m = input_lines.shift.split.map(&:to_i)
a = input_lines.shift.split.map(&:to_i)
b = input_lines.shift.split.map(&:to_i)

subseq = true
l = 0
b.each do |e_b|
  next_l = a[l..].index(e_b)
  if next_l
    l = next_l
  else
    subseq = false
    break
  end
end

puts subseq ? "Yes" : "No"

=begin
 下記の問題をプログラミングしてみよう！
整数 n, m と、数列 a_1, ... , a_n と 数列 b_1, ... , b_m が与えられます。

数列 b が数列 a の部分列かどうか判定してください。言い換えると、数列 a からいくつかの要素を取り除いて元の数列の順序で結合した数列が、
数列 b と等しくなることがあるかどうかを判定してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n m
a_1 a_2 ... a_n
b_1 b_2 ... b_m


・ 1 行目に、数列の長さを表す整数 n が与えられます。
・ 2 行目に、数列の値 a_i が半角スペース区切りで与えられます。
・ 3 行目に、数列の値 b_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
数列 b が数列 a の部分列である場合は Yes を、そうではない場合は No を出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ n ≦ 1,000
・ 1 ≦ m ≦ n
・ -100 ≦ a_i ≦ 100
・ -100 ≦ b_i ≦ 100

入力例1
7 7
-20 -85 -48 97 -86 83 -11
85 22 49 -88 -2 -31 -92

出力例1
No

入力例2
2 2
-30 97
-30 97

出力例2
Yes

入力例3
1 1
-69
-19

出力例3
No
=end
