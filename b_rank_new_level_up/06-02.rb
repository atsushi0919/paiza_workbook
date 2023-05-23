# 【配列 2】立体で計算 (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__calculate_in_three_dimensions

INPUT1 = <<"EOS"
2
1 2
2 3
3 2
2 1
EOS
OUTPUT1 = <<"EOS"
6
EOS

INPUT2 = <<"EOS"
3
1 2 3
2 3 4
3 4 5
5 4 3
4 3 2
3 2 1
1 3 5
2 4 6
3 5 7
EOS
OUTPUT2 = <<"EOS"
18
EOS

INPUT3 = <<"EOS"
8
65 15 69 36 51 58 84 35
71 48 76 90 63 60 57 40
62 28 89 76 12 57 26 47
57 62 32 94 5 49 76 26
84 38 19 14 48 44 51 33
59 28 37 55 9 89 17 11
61 69 42 35 19 19 51 68
13 69 27 73 91 23 15 58
50 13 67 61 51 79 97 37
28 41 9 52 61 10 49 11
31 97 51 17 73 29 24 95
68 96 20 98 26 40 21 65
15 20 24 1 53 48 94 6
8 4 50 100 97 64 83 35
60 31 39 66 91 11 54 55
87 97 5 98 53 45 38 69
53 47 45 23 10 60 71 26
30 14 62 7 61 25 56 16
58 22 57 57 14 16 62 62
83 50 86 99 38 62 92 51
35 24 46 78 27 75 34 82
45 3 7 3 28 13 67 8
100 1 60 2 50 3 83 39
91 36 11 86 30 53 59 70
16 24 56 32 79 5 79 77
14 10 98 72 58 36 90 72
44 36 56 80 16 14 88 92
92 70 65 99 71 11 90 74
89 31 39 71 59 44 98 67
41 16 94 81 11 52 25 78
43 50 54 7 67 62 68 58
9 93 4 96 47 64 25 62
60 98 31 42 50 74 2 18
93 28 92 95 93 4 88 34
52 1 8 13 36 65 89 93
76 97 21 23 70 67 2 48
65 8 63 69 14 13 24 88
27 59 41 12 36 31 24 84
63 50 86 16 5 60 66 56
88 31 80 15 80 85 61 51
10 100 52 96 52 3 56 48
47 67 89 66 4 43 10 13
63 90 77 78 24 48 41 25
66 43 88 11 90 95 73 88
18 64 95 4 90 20 18 81
52 32 32 12 11 38 21 33
80 98 33 12 46 14 67 8
75 58 81 56 49 12 29 76
30 14 28 57 85 60 59 41
35 76 98 47 36 48 46 8
75 31 74 32 86 74 99 41
31 63 86 44 16 45 29 49
41 8 94 21 8 13 31 2
95 51 80 97 59 15 32 95
49 34 79 13 7 11 66 31
23 53 13 35 86 87 42 19
91 44 30 63 55 55 83 4
18 56 11 76 74 54 84 8
99 47 1 14 6 87 1 6
50 55 46 13 100 21 89 87
38 58 87 31 56 96 23 32
90 60 76 46 74 92 16 88
3 14 53 39 17 7 80 59
98 31 9 57 68 42 38 46
EOS

INPUT4 = <<"EOS"
4
1 2 3 4
5 6 7 8
9 10 11 12
13 14 15 16
17 18 19 20
21 22 23 24
25 26 27 28
29 30 31 32
33 34 35 36
37 38 39 40
41 42 43 44
45 46 47 48
49 50 51 52
53 54 55 56
57 58 59 60
61 62 63 64
EOS

# input_lines = INPUT3.split("\n")

# 入力
input_lines = $stdin.read.split("\n")
n = input_lines.shift.to_i
a = n.times.map { input_lines.shift(n).map { |row| row.split.map(&:to_i) } }

#     a  ＿＿_ b    x: →
#   c ／|_d ／|     y: ↙
#   e|￣|__|__|f    z: ↓
#    |／＿_|／
#   g      h

# x,y,z 方向の集計
n -= 1
sum_of_x = []
sum_of_y = []
sum_of_z = []
sum_of_pd = []
0.upto(n) do |i|
  pd_sum = Array.new(6, 0)
  0.upto(n) do |j|
    x_sum = y_sum = z_sum = 0
    0.upto(n) do |k|
      x_sum += a[i][j][k]
      y_sum += a[i][k][j]
      z_sum += a[k][i][j]
    end
    sum_of_x << x_sum
    sum_of_y << y_sum
    sum_of_z << z_sum

    # 平面の対角集計
    pd_sum[0] += a[i][j][j]       # a-d
    pd_sum[1] += a[i][n - j][j]   # c-d
    pd_sum[2] += a[j][j][i]       # a-g
    pd_sum[3] += a[n - j][j][i]   # e-c
    pd_sum[4] += a[j][i][j]       # a-f
    pd_sum[5] += a[n - j][i][j]   # e-b
  end
  sum_of_pd.concat(pd_sum)
end

# 立方体の対角集計
sum_of_td = Array.new(4, 0)
0.upto(n) do |i|
  sum_of_td[0] += a[i][i][i]           # a-h
  sum_of_td[1] += a[i][i][n - i]       # b-g
  sum_of_td[2] += a[i][n - i][i]       # c-f
  sum_of_td[3] += a[i][n - i][n - i]   # d-e
end

# 合計の最大値を出力
max_sum = [].concat(sum_of_x, sum_of_y, sum_of_z, sum_of_pd, sum_of_td).max
puts max_sum

=begin



N × N × N の三次元配列が与えられるので、N 要素からなる縦列・横列・斜め列の和のうち、最大値を求めてください。
斜め列については、配列を立方体に見立てたときに各面を通るような斜め列と対角線のような斜め列が存在することに注意してください。

例として、下図の右下の要素を通るような斜め列は各面を通るような 3 つと立方体の中を通るような 1 つの計 4 つ存在します。



▼　下記解答欄にコードを記入してみよう

入力される値
N
A_1_1_1 A_1_1_2 ... A_1_1_N
A_1_2_1 A_1_2_2 ... A_1_2_N
...
A_1_N_1 A_1_N_2 ... A_1_N_N
A_2_1_1 A_2_1_2 ... A_2_1_N
...
A_N_N_1 A_N_N_2 ... A_N_N_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
N 要素からなる縦横斜め列の和のうち最大の値を出力してください。

条件
・1 ≦ N ≦ 50
・1 ≦ A_i_j ≦ 100

入力例1
2
1 2
2 3
3 2
2 1

出力例1
6

入力例2
3
1 2 3
2 3 4
3 4 5
5 4 3
4 3 2
3 2 1
1 3 5
2 4 6
3 5 7

出力例2
18
=end