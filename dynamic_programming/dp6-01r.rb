# 部分和問題 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dp_primer/dp_primer_partial_sums_step0

INPUT0 = <<~"EOS"
  4 9
  3
  2
  5
  6
EOS
OUTPUT0 = <<~"EOS"
  yes
EOS

INPUT1 = <<~"EOS"
  5 19
  7
  18
  5
  4
  8
EOS
OUTPUT1 = <<~"EOS"
  yes
EOS

def solve(input_lines)
  # 入力受け取り
  input_lines = input_lines.split("\n")
  n, x = input_lines.shift.split.map(&:to_i)
  *a = input_lines.map(&:to_i)

  # dpテーブル初期化
  # おもりを選ばなければ重さの和を0とすることができる
  dp = [true] + [false] * x

  # dpテーブル更新
  1.upto(n) do |i|
    x.downto(a[i - 1]) do |j|
      # a[i-1] を使って j が作れるか
      dp[j] = true if dp[j - a[i - 1]]
    end
    break if dp[x]
  end

  # x が作れるかを出力
  dp[x] ? "yes" : "no"
end

puts solve(STDIN.read)

# 確認用コード
# puts solve(INPUT1)
# > yes

#        | j
#  i     | 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 |
#  - ( 0)| t, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f, f |
# [1]( 7)| t, f, f, f, f, f, f, t, f, f, f, f, f, f, f, f, f, f, f, f |
# [2](18)| t, f, f, f, f, f, f, t, f, f, f, f, f, f, f, f, f, f, t, f |
# [3]( 5)| t, f, f, f, f, t, f, t, f, f, f, f, t, f, f, f, f, f, t, f |
# [4]( 4)| t, f, f, f, t, t, f, t, f, t, f, t, t, f, f, f, t, f, t, f |
# [5]( 8)| t, f, f, f, t, t, f, t, t, t, f, t, t, t, f, t, t, t, t, t |

=begin
1 ~ n の番号がついた n 個のおもりがあり、おもり i の重さは a_i です。
おもりを何個か選んで重さの和が x となるようにすることができるかどうか判定してください。
なお、同じおもりを2個以上選ぶことはできません。
---
(ヒント)
おもり 1 ~ n を用いて重さの和を x となるようにすることができるか、という問題を考えるために、
部分問題としておもり 1 ~ n-1 を用いて重さの和を x となるようにすることができるか、という問題を考えてみましょう。

n-1 までのおもりを用いて重さの和を x または x-a_n となるようにすることができれば、
おもり 1 ~ n を用いて重さの和を x となるようにすることができることがわかります。
よって、最初はおもり 1 のみを使えることにして問題を解き、
次にその結果を利用しておもり 1 ~ 2 を使えることにして問題を解く、ということを n まで繰り返せば、元の問題が解けそうです。

dp_k[x] を、おもり k までを用いて重さの和が x となるようにすることができるかどうかを表す真偽値とすると、
上で考察した関係は漸化式で表すと dp_k[x] = (dp_{k-1}[x] or dp_{k-1}[x-a_k]) となります。

dp_1, dp_2, ... と順に dp_n まで計算すれば問題の答えが求まります。
dp_1 から dp_n のそれぞれに対応する n 本の1次元配列 (もしくはこれに相当する2次元配列) を使って実装してもよいのですが、
dp_k[x] を求めるには dp_{k-1}[x] と dp_{k-1}[x-a_k] さえわかっていれば十分であることを踏まえると、
ループの回し方を以下の様に工夫することで、これまでと同じように1本の1次元配列で解くことができます。


for i = 0 to x
    dp[i] <- false

dp[0] <- true   // おもりを選ばなければ、重さの和を0とすることができる

for i = 1 to n  // おもり i までのおもりを使って
    for j = x down to a_i    // 重さの和を j とすることができるか？
        if dp[j-a_i] is true then
            dp[j] <- true   

if dp[x] is true then
    print "yes"
else
    print "no"


j を x から a_i へ減らす方向にループを回していることに注意してください。
逆に a_i から x へ 増やす方向にループを回すと正しく答えが求まらない可能性があります。
理由を考えてみましょう (ヒント: n = 1, a_1 = 5, x = 10 のとき、ループの回し方によって答えはどうなるか？)
=end
