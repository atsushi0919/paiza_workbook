# 値の探索 (paizaランク C 相当)
# https://paiza.jp/works/mondai/binary_search/binary_search__basic_step0

INPUT1 = <<~"EOS"
  10
  3 11 18 25 40 58 69 81 88 99
  5
  11
  100
  2
  41
  69
EOS
OUTPUT1 = <<~"EOS"
  Yes
  No
  No
  No
  Yes
EOS

def binary_search(ary, k)
  left = 0
  right = ary.length - 1

  while left <= right
    mid = (left + right) / 2
    t = ary[mid]
    if t == k
      return true
    elsif t < k
      # 中央の値より大きかった場合
      left = mid + 1
    else
      # 中央の値より小さかった場合
      right = mid - 1
    end
  end
  false
end

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary_a = input_lines.shift.split.map(&:to_i)
  q = input_lines.shift.to_i
  ary_k = input_lines.shift(q).map(&:to_i)

  ary_k.map do |k|
    binary_search(ary_a, k) ? "Yes" : "No"
  end
end

puts solve(INPUT1)

=begin
値の探索 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/binary_search/binary_search__basic_step0
問題文のURLをコピーする
下記の問題をプログラミングしてみよう！

ソートされた数列 A = (A_1, A_2, ..., A_n) と、q 個の整数 k_1, k_2, ..., k_q が与えられます。
各 k_i について、数列 A に含まれているなら Yes と、含まれていないなら No と出力してください。

なお、n, q の最大値はいずれも 200,000 です。

q 回線形探索を行うことで解けそうですが、制約を見ると数列 A のサイズは最大で 200,000 、q も最大で 200,000 ですから、
最悪で 200,000 * 200,000 回処理をする必要があり、これでは到底処理が終わりません。何か工夫をする必要があります。

A がソート済みであることに注目します。
A の真ん中の要素が k 未満であれば、A の前半分の要素もすべて k 未満であることがわかります。
つまり、A の前半分について探索する必要が無くなります。
逆に、A の真ん中の要素が k より大きければ、A の後ろ半分の要素もすべて k より大きいので、
A の後ろ半分について探索する必要が無くなります。

つまり、「対象とする探索範囲の中央の値」と「探索したい値」を比較することで、探索範囲を半分にすることができます。
このようなアプローチを 二分探索 と呼びます。

実装は、探索範囲の始点と終点を変数として持ち、
探索範囲を半分にする処理を探索範囲が十分小さくなるまで繰り返すようにするとよいです。

・区間について

本問題集の問題文・解説では、開区間・閉区間 をそれぞれ (a, b)・[a, b] と表記します。
開区間は両端点を含まない区間を、閉区間は両端点を含む区間をそれぞれ指します。つまり、

(1,5) ... 1 < x < 5 を満たす x からなる区間

[1,5] ... 1 ≦ x ≦ 5 を満たす x からなる区間

となります。

また、半開区間を (a, b] や [a, b) と表記します。
    これは一方の端点が区間に含まれており、もう一方の端点が区間に含まれていないような区間を指します。つまり、

(1,5] ... 1 < x ≦ 5 を満たす x からなる区間

[1,5) ... 1 ≦ x < 5 を満たす x からなる区間

となります。

二分探索をおこなう際は、区間をどのような形で持つか (開・閉・半開) を問題に合わせて適切に選択する必要があります。

本問においては、閉区間で持つのがよいでしょう。

/**
ソート済みの数列 A に 値 k が含まれているなら true を、含まれていないなら no を返す
*/
binary_search(A : 数列, n : 数列のサイズ, k : 探索する値)
    // 探索範囲 [left, right]
    left = 0
    right = n-1
    
    // 探索範囲を狭めていく
    while left <= right

        // 探索範囲の中央
        mid = (left + right) / 2

        if A[mid] == k then
            return true
        else if A[mid] < k then
            left = mid+1
        else
            right = mid-1
    
    return false
▼　下記解答欄にコードを記入してみよう

入力される値
n
A_1 A_2 ... A_n
q
k_1
k_2
...
k_q


1行目に、数列の要素数 n が与えられます。
2行目に、数列の要素 A_i が半角スペース区切りで与えられます。
3行目に、与えられる整数の数 q が与えられます。

続く q 行のうち i (1 ≦ i ≦ q) 行目に、整数 k_i が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
q 行出力してください。i 行目 (1 ≦ i ≦ q) には、
k_i が数列 A に含まれていれば Yes と、含まれていなければ No と出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ n ≦ 200,000
・ -10^9 ≦ A_i ≦ 10^9 (1 ≦ i ≦ n)
・ A_1 ≦ A_2 ≦ ... ≦ A_n
・ 1 ≦ q ≦ 200,000
・ -10^9 ≦ k_i ≦ 10^9 (1 ≦ i ≦ q)

入力例1
10
3 11 18 25 40 58 69 81 88 99
5
11
100
2
41
69

出力例1
Yes
No
No
No
Yes
=end