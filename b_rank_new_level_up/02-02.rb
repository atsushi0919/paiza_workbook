# 【シミュレーション 2】perfuct shuffle (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__perfect_shuffle

# トランプの設定
SUIT = %w(S H D C)
NUMBER = (1..13).to_a

# 入力
k = gets.to_i
cards = SUIT.product(NUMBER).map { |s, n| "#{s}_#{n}" }
len = cards.length

k.times do
  # 全52枚の山札を上半分と下半分に分ける
  upper, lower = cards.each_slice(len / 2).to_a

  cards = []
  (len / 2).times do
    # 下半分の一番下のカードを新しい山札に重ねる
    cards.unshift(lower.pop)
    # 上半分の一番下のカードを新しい山札に重ねる
    cards.unshift(upper.pop)
  end
end

# 山札の上から出力
puts cards.join("\n")

=begin
トランプのシャッフルの種類の一つにパーフェクトシャッフルというものがあり、
パーフェクトシャッフルにおける 1 回のシャッフルは次の一連の操作を指します。

1. 全52枚の山札を上半分と下半分に分ける。
2. 下半分の一番下のカード, 上半分の一番下のカード, 下半分の下から 2 番目のカード, 上半分の下から 2 番目のカード, ... ,
下半分の一番上のカード, 上半分の一番上のカード という順番でカードを積み重ねていく。

トランプの絵柄をS(スペード), H(ハート), D(ダイア), C(クラブ) と表現するものとし、
その絵柄の 1 からキングまでの各カードを S_1 , ... , S_13 のように表現するものとします。

上から S_1, ... , S_13, H_1, ... , H_13, D_1, ... , D_13, C_1, ... , C_13
という順のトランプの山札を用いてパーフェクトシャッフルの操作を K 回おこなった後の山札のカードを上から順に出力してください。

カードの出力には {絵柄のアルファベット}_{カードの数字} の表現法を用いてください。

▼　下記解答欄にコードを記入してみよう

入力される値
K

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
パーフェクトシャッフルの操作を K 回行った後の山札のカードを上から順 {絵柄のアルファベット}_{カードの数字} の表現法を用いて出力してください。
詳しくは入出力例を参考にしてください。

条件
・0 ≦ K ≦ 100

入力例1
1

出力例1
S_1
D_1
S_2
D_2
S_3
D_3
S_4
D_4
S_5
D_5
S_6
D_6
S_7
D_7
S_8
D_8
S_9
D_9
S_10
D_10
S_11
D_11
S_12
D_12
S_13
D_13
H_1
C_1
H_2
C_2
H_3
C_3
H_4
C_4
H_5
C_5
H_6
C_6
H_7
C_7
H_8
C_8
H_9
C_9
H_10
C_10
H_11
C_11
H_12
C_12
H_13
C_13

入力例2
3

出力例2
S_1
D_7
H_1
C_7
D_1
S_8
C_1
H_8
S_2
D_8
H_2
C_8
D_2
S_9
C_2
H_9
S_3
D_9
H_3
C_9
D_3
S_10
C_3
H_10
S_4
D_10
H_4
C_10
D_4
S_11
C_4
H_11
S_5
D_11
H_5
C_11
D_5
S_12
C_5
H_12
S_6
D_12
H_6
C_12
D_6
S_13
C_6
H_13
S_7
D_13
H_7
C_13
=end
