# upper_bound (paizaランク B 相当)
# https://paiza.jp/works/mondai/binary_search/binary_search__basic_step2

INPUT1 = <<~"EOS"
  10
  45 62 11 81 75 90 13 2 97 32
  5
  90
  75
  50
  1
  63
EOS
OUTPUT1 = <<~"EOS"
  1
  3
  5
  10
  4
EOS

def binary_search(ary, k)
  left = 0
  right = ary.length - 1

  while left < right
    mid = (left + right) / 2
    if ary[mid] <= k
      # k が ary[mid] 以上の時 ary[mid] 以下 NG
      left = mid + 1
    else
      # k が ary[mid] 未満の時 ary[mid] 以上 OK
      right = mid
    end
  end
  ary[right..].length
end

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary_a = input_lines.shift.split.map(&:to_i)
  q = input_lines.shift.to_i
  ary_k = input_lines.shift(q).map(&:to_i)

  ary_a.sort!
  ary_k.map do |k|
    binary_search(ary_a, k)
  end
end

puts solve(INPUT1)

=begin
upper_bound (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/binary_search/binary_search__basic_step2
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
n 人の生徒が受けた、10^9 点満点のテストの採点結果 A_1, A_2, ..., A_n があります。
あなたは合格点を自由に設定することができます。
合格点が k 点のとき、k 点より大きい点数を取った生徒が合格で、k 点以下の点数を取った生徒が不合格です。



q 個の整数 k_1, k_2, ..., k_q が与えられます。
各 k_i について、合格点が k_i のときに合格する生徒の数を答えてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
A_1 A_2 ... A_n
q
k_1
k_2
...
k_q


1行目に、生徒の人数 n が与えられます。

2行目に、採点結果 A_i が半角スペース区切りで与えられます。

3行目に、合格点の候補数 q が与えられます。

続く q 行のうち i (1 ≦ i ≦ q) 行目に、合格点の候補 k_i が与えられます。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
q 行出力してください。i 行目 (1 ≦ i ≦ q) には、合格点を k_i としたときに合格する生徒の数を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。



・ 入力はすべて整数

・ 1 ≦ n ≦ 100,000

・ 0 ≦ A_i ≦ 10^9 (1 ≦ i ≦ n)

・ 1 ≦ q ≦ 100,000

・ 0 ≦ k_i ≦ 10^9 (1 ≦ i ≦ q)

入力例1
10
45 62 11 81 75 90 13 2 97 32
5
90
75
50
1
63

出力例1
1
3
5
10
4
=end
