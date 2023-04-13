# 【全探索 1】高い寿司を食いたい！ (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__get_richer_sushi

INPUT1 = <<"EOS"
5 3
100
200
300
400
500
EOS
OUTPUT1 = <<"EOS"
1200
EOS

INPUT2 = <<"EOS"
7 2
1000
200
500
600
300
300
2000
EOS
OUTPUT2 = <<"EOS"
3000
EOS

# require "byebug"
# debugger

# n, k, *plates = INPUT1.split.map(&:to_i)

# 入力
n, k, *plates = $stdin.read.split.map(&:to_i)

# 1 ~ k 皿目までの価格で初期化
max_price = current_price = plates[...k].sum
# 2 ~ n 皿目から取り始める場合の価格を調べる
1.upto(n - 1) do |i|
  # 新しく取る皿の位置
  new_plate_idx = (i + k - 1) % n
  # i 枚目から k 枚取った時の価格
  current_price = current_price - plates[i - 1] + plates[new_plate_idx]
  # 最大価格更新
  max_price = [current_price, max_price].max
end

# 出力
puts max_price

=begin
paiza 君は家族と一緒に回転寿司に来ています。
回転寿司の円形のレーンには、価格が P_1, ..., P_N の N 枚の寿司が順番に流れています。
（価格が P_1 の寿司と P_N の寿司は隣接しています。）
paiza 君は、家族が目を離した隙にレーンから連続した K 枚の寿司をこっそり取って食べてしまおうと考えました。
paiza 君は普段食べれない高いお寿司を多く食べたいので、取る K 枚の寿司の合計金額ができるだけ高くなるように寿司を取りたいです。
paiza 君が食べることができる寿司の合計金額の最大値を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
N K
P_1
...
P_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
max_prime

・連続する K 枚の寿司の合計金額の最大値を出力してください。
条件
・1 ≦ N ≦ 1000
・1 ≦ K ≦ N
・100 ≦ p_i ≦ 10000 (1 ≦ i ≦ N)

入力例1
5 3
100
200
300
400
500

出力例1
1200

入力例2
7 2
1000
200
500
600
300
300
2000

出力例2
3000
=end
