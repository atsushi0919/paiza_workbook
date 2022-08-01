# lower_bound (paizaランク B 相当)
# https://paiza.jp/works/mondai/binary_search/binary_search__basic_step1

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
  2
  4
  5
  10
  4
EOS

def binary_search(ary, k)
  left = 0
  right = ary.length - 1

  while left < right
    mid = (left + right) / 2
    if ary[mid] < k
      # k が ary[mid] を超える時 mid以下NG
      left = mid + 1
    else
      # k が ary[mid] 以下の時 mid以上OK
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
lower_bound (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/binary_search/binary_search__basic_step1
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
n 人の生徒が受けた、10^9 点満点のテストの採点結果 A_1, A_2, ..., A_n があります。
あなたは合格点を自由に設定することができます。
合格点が k 点のとき、k 点以上を取った生徒が合格で、k 点未満を取った生徒が不合格です。

q 個の整数 k_1, k_2, ..., k_q が与えられます。
各 k_i について、合格点が k_i のときに合格する生徒の人数を答えてください。

なお、n, q の最大値はいずれも 200,000 です。

制約を見ると、生徒の人数 n は最大で 200,000 人で、与えられる合格点の候補 k の数は 200,000 です。
k が与えられるたびに生徒ひとりひとりの点数を確認し、合格者数を求めるアプローチで解こうとすると、
最悪で 200,000 * 200,000 回処理をする必要があり、これでは実行時間制限に間に合いません。

二分探索は、このような問題にも適用することができます。
具体的には、単調性のある列の境界を求める状況に適用することができます。

以降では、簡単のために 0 始まりの添字で記述します。
A_0, A_1, ..., A_{n-1} をソートします。
すると、A_x >= k ならば、y >= x を満たすすべての y について A_y >= k であることから、
A_i >= k を満たすような i の最小値 min_i がわかれば、合格者数の人数は n - min_i で求めることができます。
ただし、A_i >= k を満たすような i がひとつも存在しない場合は、min_i を n とします。

min_i は、以下のようにして求めることができます。

/**
    A_i >= k を満たす最小の i を返す
    A_i >= k を満たす i が存在しない場合は n を返す
*/
binary_search(A : 数列, n : 数列のサイズ, k : 基準)
    // 探索範囲 [left, right]
    left = 0
    right = n
    
    // 探索範囲を狭めていく
    while left < right
        // 探索範囲の中央
        mid = (left + right) / 2

        if a[mid] < k then
            // a[0] ~ a[mid] は k 未満なので調べる必要が無い
            left = mid+1
        else
            right = mid
    
    return right


紙に長さ10程度のソートされた数列を書き、適当な値 k に対して binary_search がどのように動作するかを追ってみることをおすすめします。

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

・ 1 ≦ n ≦ 200,000

・ 0 ≦ A_i ≦ 10^9 (1 ≦ i ≦ n)

・ 1 ≦ q ≦ 200,000

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
2
4
5
10
4
=end
