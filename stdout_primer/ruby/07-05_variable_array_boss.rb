# 【行によって長さが違う二次元配列の表示】すべての行の長さと値が不定な 2 次元配列の出力 (paizaランク B 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_boss

# 入出力例
INPUT1 = <<~"EOS"
  10 4
  1 2 3 4 5 6 7 8 9 10
  2 6 1 1
EOS
OUTPUT1 = <<~"EOS"
  1 2
  3 4 5 6 7 8
  9
  10
EOS

INPUT2 = <<~"EOS"
  1 1
  1
  1
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

# 解答例1
# 入力
n, m = gets.split.map(&:to_i)
ary_a = gets.split.map(&:to_i)
ary_b = gets.split.map(&:to_i)
# ary_b の要素で繰り返し処理
ary_b.each do |b|
  # ary_a の先頭から b 個分の要素を半角スペース区切りで出力
  puts(ary_a[...b].join(" "))
  # 出力済みの要素を削除
  ary_a = ary_a[b..]
end

# 解答例2
# 入力
n, m = gets.split.map(&:to_i)
ary_a = gets.split.map(&:to_i)
ary_b = gets.split.map(&:to_i)
# ary_a の先頭から b 個取り出して出力
ary_b.each { |b| puts(ary_a.shift(b).join(" ")) }

=begin
【行によって長さが違う二次元配列の表示】すべての行の長さと値が不定な 2 次元配列の出力 (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/stdout_primer/stdout_primer__variable_array_boss
問題文のURLをコピーする
 チャレンジする言語

得意な言語を選択してください
コードを書いて解いてみる
問題
 下記の問題をプログラミングしてみよう！
自然数 N, M と N 個の自然数からなる数列 A と M 個の自然数からなる数列 B が与えられます。
1 行目には数列 A の最初の B_1 個の値を出力し、2 行目にはその次から B_2 個の値を出力します。
このように、i 行目には数列 A の 1 + B_1 + B_2 + ... + B_{i - 1} 番目の値から B_i 個の値を出力してください。
言い換えると、数列 A の値を B_1 個、B_2個、... B_M 個で分割し、それぞれの数列を改行区切りで出力してください。


入力される値
N M
A_1 A_2 A_3 ... A_N
B_1 B_2 B_3 ... B_M

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
答えの数値を出力してください。


A_1 ... A_{B_1}
A_{B_1+1} ... A_{B_1+B_2-1}
A_{B_1+B_2} ... A_{B_1+B_2+B_3-1}
...
A_{B_1+...+B_{M-1}} ... A_{B_1+B_2+...+B_M}


末尾に改行を入れ、余計な文字、空行を含んではいけません。
条件
すべてのテストケースにおいて、以下の条件をみたします。

* N, Mは 1 以上 100 以下
* M ≦ N
* A, Bの各要素の値は 1 以上 100 以下
* B_1 + B_2 + B_3 + ... + B_M = N

入力例1
10 4
1 2 3 4 5 6 7 8 9 10
2 6 1 1

出力例1
1 2
3 4 5 6 7 8
9
10

入力例2
1 1
1
1

出力例2
1
=end
