# 区間和 A

INPUT1 = <<"EOS"
4 2
16
88
10
-65
2 4
1 2
EOS
OUTPUT1 = <<"EOS"
33
104
EOS

input_lines = $stdin.read.split("\n")
n, k = input_lines.shift.split.map(&:to_i)
a = input_lines.shift(n).map(&:to_i)
lr = input_lines.shift(k).map { |l| l.split.map(&:to_i) }

s = [0]
a.each { |a_i| s << s[-1] + a_i }

puts lr.map { |l, r| s[r] - s[l - 1] }.join("\n")

=begin
長さ N の数列 A と、K 個の区間 (l_1,r_1) ... (l_K,r_K) が与えられるので、
各区間についての A の区間和 A_{l_i} + ... + A_{r_i} (1 ≦ i ≦ K) を求めてください。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

N K

A_1

...

A_N

l_1 r_1

...

l_K r_K
・1 行目では、配列 A の要素数 N と与えられる整数の数 K が与えられます。
・続く N 行では、配列 A の要素が A_1 から順に与えられます。
・続く K 行では、和を求めるのに使う区間の値 l , r が与えられます。

条件
・1 ≦ N , K ≦ 100,000
・-100 ≦ A_i ≦ 100 (1 ≦ i ≦ N)
・1 ≦ l_i ≦ r_i ≦ N (1 ≦ i ≦ K)

出力される値
ans_1

...

ans_K
・i 行目に A_{l_i} + ... + A_{r_i} の和 ans_i (1 ≦ i ≦ K)を出力してください。
・また、出力の末尾には改行を入れてください。

入力例
4 2
16
88
10
-65
2 4
1 2

出力例
33
104
=end
