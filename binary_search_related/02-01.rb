# 氷上輸送 (paizaランク B 相当)
# https://paiza.jp/works/mondai/binary_search_related/binary_search_related__related_algorithms_1

INPUT1 = <<"EOS"
2 4
4 2
6 1
8
EOS

OUTPUT1 = <<"EOS"
4
EOS

# 初速 v を与えたとき $L までの運搬時間
def transport(v)
  time = 0.0
  dist = 0
  $lr.each do |l, r|
    time += (l - dist) / v
    dist = l
    v -= r
    return if v <= 0 
  end
  time += ($L - dist) / v
end

# 入力
input_lines = $stdin.read.split("\n")
n, t = input_lines.shift.split.map(&:to_i)
$lr = input_lines.shift(n).map {|r|r.split.map(&:to_i)}
$L = input_lines.shift.to_i

# 探索
l = 0.0
r = ($L * 10**5).to_f
while (r - l).round(6) > 0
  mid = (l + r) / 2
  time = transport(mid)
  time && time < t ? r = mid : l = mid
end

# 出力
p r

=begin
n, t = map(int, input().split())

lr = []
for i in range(n):
    lr.append(tuple(map(int, input().split())))
L = int(input())
# print(lr)
lr.append((L, 0))
# print(lr)

# 初速度vで輸送したときの時間をシミュレート
def transport(v):
    time = 0.0
    x = 0
    for l, r in lr:
        time += (l - x) / v
        x = l
        v -= r
        if v <= 0:
            return -1 # 速度が0以下なら輸送できない
        # print(x, v, time)
    return time

# print(transport(15))
ub = 1e9 + 1e10 + 1 # 初速度ubあれば輸送できる
lb = 0              # 初速度lbでは輸送できない

while ub - lb > 1e-6: # 許容誤差付近までubとlbを近づけていく
    mid = (lb + ub) / 2
    time = transport(mid)
    if time == -1 or time > t: # 制限時間よりも時間がかかる
        lb = mid
    else:
        ub = mid

print(ub)
# print(lb)

氷の世界に来た paiza 君は、荷物を氷の上で輸送する仕事をすることになりました。
今回の仕事では、x 座標 0 から L まで、x 軸上で荷物を滑らせて輸送をおこないます。ここで、座標での距離 1 を 1 メートルとします。
この氷に摩擦はなく、滑らせた荷物は等速直線運動をします。


ところが、paiza 君が入念に調査したところ、輸送路の途中、x 座標 l_1, l_2, ..., l_n には亀裂があり、
それぞれ荷物の速度を r_1, r_2, ..., r_n (メートル毎秒) だけ減速させることがわかりました。

輸送には制限時間があり、この仕事は t 秒以内に終わらせなければなりません。
輸送を t 秒以内に終わらせるためには、初速度を何メートル毎秒以上にする必要があるか求めてください。

ただし、ある地点での減速後の速度が負になってしまう場合は、輸送ができないものとします。

▼　下記解答欄にコードを記入してみよう

入力される値
n t
l_1 r_1
l_2 r_2
...
l_n r_n
L

・ 1 行目に、亀裂の個数を表す整数 n と、制限時間を表す整数 t がこの順に半角スペース区切りで与えられます。
・ 続く n 行では、i 番目の亀裂の x 座標を表す整数 l_i と、その亀裂での荷物の減速度を表す整数 r_i がこの順に半角スペース区切りで与えられます。(1 ≦ i ≦ n)
・ n + 2 行目に、輸送終了地点の x 座標を表す整数 L が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
輸送を t 秒以内に終わらせるためには、初速度を何メートル毎秒以上にする必要があるかを表す小数を一行で出力してください。
また、末尾に改行を入れ、余計な文字を含んではいけません。

相対誤差または絶対誤差が 10^-6 以下であれば正解とみなします。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ n ≦ 100000 = 10^5
・ 1 ≦ t ≦ 100000 = 10^5
・ 0 < l_1 < l_2 < ... < l_n < L ≦ 1000000000 = 10^9
・ 1 ≦ r_i ≦ 100000 = 10^5 (1 ≦ i ≦ n)

入力例1
2 4
4 2
6 1
8

出力例1
4
=end