# ある範囲に含まれている整数の個数 (paizaランク B 相当)
# https://paiza.jp/works/mondai/binary_search/binary_search__basic_boss

INPUT1 = <<~"EOS"
  10
  -45 62 -11 81 75 -90 13 2 97 -32
  5
  -30 65
  -90 -90
  -15 85
  -50 50
  -10 -1
EOS
OUTPUT1 = <<~"EOS"
  4
  1
  6
  5
  0
EOS

def lower_bound(ary, k)
  left = 0
  right = ary.length - 1

  while left < right
    mid = (left + right) / 2
    if ary[mid] < k
      # kがary[mid]を超える時
      left = mid + 1
    else
      # kがary[mid]未満の時
      right = mid
    end
  end
  right
end

def upper_bound(ary, k)
  left = 0
  right = ary.length - 1

  while left < right
    mid = (left + right) / 2
    if ary[mid] <= k
      # k が ary[mid] 以上の時
      left = mid + 1
    else
      # k が ary[mid] 未満の時
      right = mid
    end
  end
  right
end

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary_a = input_lines.shift.split.map(&:to_i)
  q = input_lines.shift.to_i
  ary_b = input_lines.shift(q).map { |l| l.split.map(&:to_i) }

  ary_a.sort!
  ary_b.map do |l, r|
    lower_bound(ary_a, r) - upper_bound(ary_a, l)
  end
end

p solve(INPUT1)

=begin
ある範囲に含まれている整数の個数 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/binary_search/binary_search__basic_boss
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
数列 A = (A_1, A_2, ..., A_n) と、整数の組 (l_1, r_1), (l_2, r_2), ..., (l_q, r_q) が与えられます。


各組 (l_i, r_i) について、数列 A に含まれる値のうち l_i 以上 r_i 以下であるものの個数を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
A_1 A_2 ... A_n
q
l_1 r_1
l_2 r_2
...
l_q r_q


1行目に、数列の要素数 n が与えられます。

2行目に、A_i が半角スペース区切りで与えられます。

3行目に、与えられる整数の組の個数 q が与えられます。

続く q 行のうち i (1 ≦ i ≦ q) 行目に、整数の組 (l_i, r_i) が与えられます。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
q 行出力してください。

i 行目 (1 ≦ i ≦ q) には、数列 A に含まれる値のうち l_i 以上 r_i 以下であるものの個数を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。



・ 入力はすべて整数
・ 1 ≦ n ≦ 200,000
・ -10^9 ≦ A_i ≦ 10^9 (1 ≦ i ≦ n)
・ 1 ≦ q ≦ 200,000
・ -10^9 ≦ l_i ≦ r_i ≦ 10^9 (1 ≦ i ≦ q)

入力例1
10
-45 62 -11 81 75 -90 13 2 97 -32
5
-30 65
-90 -90
-15 85
-50 50
-10 -1

出力例1
4
1
6
5
0
=end
