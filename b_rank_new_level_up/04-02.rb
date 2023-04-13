# 【全探索 2】コップの水 (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__a_cup_of_water

INPUT1 = <<"EOS"
3 100
30
40
50
EOS
OUTPUT1 = <<"EOS"
90
EOS

INPUT2 = <<"EOS"
5 100
99
98
97
96
5
EOS
OUTPUT2 = <<"EOS"
99
EOS

# n, x, *cups = INPUT2.split.map(&:to_i)

# 入力
n, x, *cups = $stdin.read.split.map(&:to_i)

# コップの組み合わせで作れる水の量
water = [true] + Array.new(x)
cups.each do |cup|
  x.downto(cup) { |i| water[i] = true if water[i - cup] }
end

# 出力
puts water.rindex(&:itself)

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！
paiza 君は度胸試しとして、コップに水をギリギリまで入れるゲームをすることにしました。
ルールは次の通りです。

・w_1 ml, ..., w_N ml の水の入った N 個の小さなコップを用意する。
・容量が X ml の大きなコップに、小さなコップの中から 1 つ選び、そのコップの水を全て入れる。
・大きなコップに溢れないようにギリギリまで水を入れることを目標にする。

このゲームにおいて paiza 君が最適なプレイをしたとき、大きなコップに水を何 ml 入れることができるかを求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
N X
w_1
...
w_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・溢れないようにコップに入れられる水の最大量(ml)を出力してください。

条件
・1 ≦ N ≦ 15
・1 ≦ X ≦ 1000
・1 ≦ w_i ≦ X (1 ≦ i ≦ N)

入力例1
3 100
30
40
50

出力例1
90

入力例2
5 100
99
98
97
96
5

出力例2
99
=end
