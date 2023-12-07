# log2
# https :/ / paiza.jp / works / mondai / double_roop_problems / double_roop_problems__log2


INPUT1 = "4"
OUTPUT1 = "3"

n=gets.to_i
c=0
(1..n).each{|i|
  while i%2==0
    i/=2
    c+=1
  end
}
p c

=begin
n = int(input())

ans = 0
for i in range(1, n + 1):
    now = i
    while now % 2 == 0:
        now //= 2
        ans += 1

print(ans)

整数 N が与えられるので、1 × 2 × ... × (N-1) × N を最大で何回 2 で割ることができるかを求めてください。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

N
・ 整数 N が 1 行で与えられます。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 2 ≦ N ≦ 500

出力される値
2 で 1 * 2 * ... * (N-1) * N を割ることができる最大の回数を 1 行で出力してください。
出力の末尾には改行を入れてください。

入力例
4
出力例
3

入力例2
10
出力例2
8
入力例3
100
出力例3
97
入力例4
500
出力例4
494
=end
