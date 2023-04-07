# 【シミュレーション 3】燃費 (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__fuel_economy

INPUT1 = <<"EOS"
10
7 3
100 1
50
EOS
OUTPUT1 = <<"EOS"
380
EOS

INPUT2 = <<"EOS"
50
5 4
100 2
30 60
EOS
OUTPUT2 = <<"EOS"
500
EOS

# 入力
input_lines = $stdin.read.split("\n")
x = input_lines.shift.to_i
f1, f2 = input_lines.shift.split.map(&:to_i)
l, n = input_lines.shift.split.map(&:to_i)
s = input_lines.shift.split.map(&:to_i)

# 初期設定
s.unshift(0).push(l)  # 開始・終了地点追加
acc_dist = 0          # 加速距離
dec_dist = 0          # 減速距離

# 加速距離, 減速距離を計算
s.each_cons(2) do |start, stop|
  section_dist = stop - start
  acc_dist += [section_dist, x].min
  dec_dist += [section_dist - x, 0].max
end

# 出力
puts acc_dist * f1 + dec_dist * f2

=begin
一般的な車では、車が止まった状態から発進する際は燃費がよくないことが知られています。
このことを知った paiza 君は発進時とそれ以外での燃費を分けて考えることで実際の燃費を求めたいと考えました。

具体的には、発進から X m 走るまでは 1 m あたり燃料が F_1 ml, 発進から X m 走った後から止まるまでは 1 m あたり燃料が F_2 ml かかります。
途中、出発地点から s_1(m), ..., s_N(m) の地点で一時停止をしながら全長 L m を走ると、全体を通して必要な燃料は何 ml になるでしょうか？

なお、停車中の燃料の消費や燃料切れについては考えないものとします。

▼　下記解答欄にコードを記入してみよう

入力される値
X
F_1 F_2
L N
s_1 ... s_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
途中 s_1(m), ..., s_N(m) の地点で一時停止をしながら全長 L m を走ると、全体を通して必要な燃料(ml) を出力してください。

条件
・1 ≦ X ≦ 1000
・1 ≦ F_2 ≦ F_1 ≦ 100
・1 ≦ N ≦ 1000
・0 < s_1
・s_i < s_{i+1}(1 ≦ i < N)
・s_N ≦ L ≦ 1,000,000,000

入力例1
10
7 3
100 1
50

出力例1
380

入力例2
50
5 4
100 2
30 60

出力例2
500
=end
