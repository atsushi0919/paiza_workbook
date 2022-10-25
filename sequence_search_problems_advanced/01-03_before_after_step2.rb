# 連続する k 要素 1 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__before_after_step2

INPUT1 = <<~"EOS"
  3 3
  -50 -50 -50
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  2 2
  -42 -42
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

_, k, *a = INPUT2.split.map(&:to_i)

max_idx = -1
max_sum = -Float::INFINITY
a.each_cons(k).with_index(1) do |nums, idx|
  tmp_sum = nums.sum
  if tmp_sum > max_sum
    max_idx = idx
    max_sum = tmp_sum
  end
end

puts max_idx

=begin
整数 n と、数列 a_1, ... , a_n が与えられます。

連続する k 要素の和が最大となる箇所を探してください。
具体的には、 a_i + a_{ i + 1 } + ... + a_{ i + k - 1 } が最大となる i ( 1 ≦ i ≦ n - k + 1 )を答えてください。
そのような箇所が複数ある場合は、そのうちもっとも 小さい i を答えてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n k
a_1 a_2 ... a_n


・ 1 行目に、数列の長さを表す整数 n と和を計算する要素数 k が与えられます。
・ 2 行目に、数列の値 a_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
連続する k 要素の和が最大となる箇所を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ k ≦ n ≦ 1,000
・ -100 ≦ a_i ≦ 100

入力例1
3 3
-50 -50 -50

出力例1
1

入力例2
2 2
-42 -42

出力例2
1
=end
