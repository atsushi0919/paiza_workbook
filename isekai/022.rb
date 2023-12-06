# 累積和

INPUT1 = <<"EOS"
3 1
69
12
28
3
EOS
OUTPUT1 = <<"EOS"
109
EOS

input_lines = $stdin.read.split("\n")
n, k = input_lines.shift.split.map(&:to_i)
a = input_lines.shift(n).map(&:to_i)
q = input_lines.shift(k).map(&:to_i)

s = [0]
a.each { |a_i| s << s[-1] + a_i }

q.each { |i| puts s[i] }

=begin
長さ N の数列 A と、K 個の整数 Q_1 ... Q_K が与えられるので、各整数 Q_i (1 ≦ i ≦ K) について A_1 ... A_{Q_i} の和を求めてください。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

N K

A_1

...

A_N

Q_1

...

Q_K
・1 行目では、配列 A の要素数 N と与えられる整数の数 K が与えられます。
・続く N 行では、配列 A の要素が A_1 から順に与えられます。
・続く K 行では、整数 Q_1 ... Q_K が与えられます。

条件
・1 ≦ N , K ≦ 100,000
・-100 ≦ A_i ≦ 100 (1 ≦ i ≦ N)
・1 ≦ Q_i ≦ N (1 ≦ i ≦ K)

出力される値
ans_1

...

ans_K
・i 行目に A_1 ... A_{Q_i} の和 ans_i (1 ≦ i ≦ K)を出力してください。
・また、出力の末尾には改行を入れてください。

入力例

3 1
69
12
28
3

出力例

109
=end
