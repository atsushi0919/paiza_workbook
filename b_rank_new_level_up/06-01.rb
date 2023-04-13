# 【配列 1】平面で計算 (paizaランク C 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__calculate_in_two_dimensions

INPUT1 = <<"EOS"
3
1 2 3
4 5 6
7 8 9
EOS
OUTPUT1 = <<"EOS"
24
EOS

INPUT2 = <<"EOS"
4
1 2 3 4
2 3 4 1
3 4 1 2
4 1 2 3
EOS
OUTPUT2 = <<"EOS"
16
EOS

# input_lines = INPUT1.split("\n")

# 入力
input_lines = $stdin.read.split("\n")
n = input_lines.shift.to_i
a = input_lines.shift(n).map { |row| row.split.map(&:to_i) }

# 各ラインの合計値
sum_of_line = []
sum_of_diag = [0] * 2
0.upto(n - 1) do |i|
  sum_of_line << a[i].sum                               # 横
  sum_of_line << 0.upto(n - 1).map { |j| a[j][i] }.sum  # 縦
  sum_of_diag[0] += a[i][i]                             # 対角1
  sum_of_diag[1] += a[n - 1 - i][i]                     # 対角2
end

# 合計の最大値を出力
max_sum = (sum_of_line + sum_of_diag).max
puts max_sum

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
N × N の二次元配列 A が与えられるので、N 要素からなる縦列・横列・斜め列の和のうち、最大のものを求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
N
A_1_1 A_1_2 ... A_1_N
...
A_N_1 ... A_N_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
N 要素からなる縦横斜め列の和のうち最大の値を出力してください。

条件
・1 ≦ N ≦ 100
・1 ≦ A_i_j ≦ 100

入力例1
3
1 2 3
4 5 6
7 8 9

出力例1
24

入力例2
4
1 2 3 4
2 3 4 1
3 4 1 2
4 1 2 3

出力例2
16
=end
