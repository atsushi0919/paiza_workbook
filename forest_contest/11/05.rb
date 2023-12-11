# ロボットの移動 - その 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_011/forest_contest_011__c_robot_movement_2

INPUT1=<<"EOS"
5 3
EOS
OUTPUT1=<<"EOS"
9
EOS

INPUT2=<<"EOS"
-66 -7
EOS
OUTPUT2=<<"EOS"
131
EOS

INPUT3 = <<"EOS"
-100 -100
EOS
OUTPUT3 = <<"EOS"
200
EOS

INPUT4 = <<"EOS"
74 -77
EOS
OUTPUT4 = <<"EOS"
153
EOS

x,y=gets.split.map{|x|x.to_i.abs};s=[x,y].min*2;p x==y ? s : s+(x-y).abs*2-1

# x, y = gets.split.map{|x|x.to_i.abs}
# s = [x, y].min * 2
# p s
# d = (x - y).abs
# s += d * 2 - 1 if d > 0
# puts s

=begin
2 次元グリッドにおいて、ロボットは(0,0)の初期位置から目標地点(x,y)まで移動したいです。
ロボットは 1 ステップにつき、以下の 5 種類の動きを取ることができます。
・(i,j) → (i,j + 1)
・(i,j) → (i + 1,j)
・(i,j) → (i,j - 1)
・(i,j) → (i - 1,j)
・(i,j)の位置で静止

しかし、更なる条件として、ロボットは同じ動きを連続で取ることができません。
この場合、ロボットが初期位置から目標地点に到達するには最低何ステップ必要か求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
x y


・ 1 行目に、目標地点の座標 x, y がそれぞれ半角スペース区切りで入力されます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
ロボットが初期位置から目標地点に到達するための最低ステップ数を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ -100 ≦ x, y ≦ 100

入力例1
5 3
出力例1
9
=end
