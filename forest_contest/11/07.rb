# 全員が正答 (paizaランク B 相当)
# https://paiza.jp/works/mondai/forest_contest_011/forest_contest_011__b_easyproblem

input_lines = $stdin.read.split("\n")
n, m = input_lines.shift.split.map(&:to_i)
c = input_lines.shift(n).map { |r| r.split.map(&:to_i) }

is_all_correct = c.transpose.any? { |r| r.all?(1) }

puts is_all_correct ? "Yes" : "No"

=begin
パイザ小学校であるテストを行いました。問題は n 問あり、m 人の生徒の解答の正誤が与えられるとき、
生徒が全員正答できた問題があるかどうかを判定してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n m
c_{1,1} ... c_{1,n}
...
c_{m,1} ... c_{m,n}


・ 1 行目にテストの問題数 n,生徒数 m がそれぞれ整数で半角スペース区切りで与えられます。
・ 2 行目以降に 各生徒の各問題の解答の正誤が整数で半角スペース区切りで与えられます。c\_{i,j}は i 番目の生徒の j 番目の問題の解答結果（1 ならば「正答」、0 ならば「不正答」を表します。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
生徒が全員正答できた問題がある場合は「Yes」を、そうでない場合は「No」を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ n ≦ 100
・ 1 ≦ m ≦ 100
・ 0 ≦ c_{i,j} ≦ 1 (1 ≦ i ≦ m,1 ≦ j ≦ n)

入力例1
3 2
1 1 1
0 0 1

出力例1
Yes

入力例2
3 2
1 0 1
0 1 0

出力例2
No

入力例3
3 1
1 0 1

出力例3
Yes
=end
