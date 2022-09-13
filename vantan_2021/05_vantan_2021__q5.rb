# Q5: ペイントソフト (paizaランク S 相当)
# https://paiza.jp/works/mondai/vantan_2021/vantan_2021__q5_paint_software

INPUT1 = <<~"EOS"
  10 10 100 100
  70 50
  30 80
  50 40
  20 90
  2 10 30
  3 60 45
  4 35 95
  5 10 60
  6 25 85
  7 70 95
  8 10 85
  9 80 10
  10 35 20
  11 15 30
  1 1
  1 51
  7 99
  31 81
  90 10
  95 95
  35 95
  25 20
  40 51
  51 45
EOS
OUTPUT1 = <<~"EOS"
  11
  5
  8
  1
  9
  7
  4
  10
  1
  3
EOS

# if (max(x1, x3) < min(x2, x4)) and (max(y1, y3) < min(y2, y4)):
#     print('Yes Overlap!')
# else:
#     print('No')

# require "byebug"
# byebug

Rectangle = Struct.new(:x1, :y1, :x2, :y2, :color)

input_lines = INPUT1.split("\n")
n, q, h, w = input_lines.shift.split.map(&:to_i)
x_y = input_lines.shift(4).map { |line| line.split.map(&:to_i) }
opes = input_lines.shift(n).map { |line| line.split.map(&:to_i) }
ques = input_lines.shift(q).map { |line| line.split.map(&:to_i) }

rects = [Rectangle.new(0, 0, x_y[0][0], x_y[0][1], 1),
         Rectangle.new(0, x_y[1][1], x_y[1][0], h, 1),
         Rectangle.new(x_y[2][0], x_y[2][1], w, h, 1),
         Rectangle.new(x_y[3][0], 0, w, x_y[3][1], 1)]

copied_rects = rects.dup
rects.each do |r1|
  new_rects = []
  copied_rects.each do |r2|
    next if r1 == r2
    if [r1.x1, r2.x1].max < [r1.x2, r2.x2].min && [r1.y1, r2.y1].max < [r1.y2, r2.y2].min
      r1, r2 = r2, r1 if r1.x1 > r2.x1
      if r1.y1 < r2.y1
        new_rect = Rectangle.new(r2.x1, r2.y1, r1.x2, r1.y2, 1)
      else
        new_rect = Rectangle.new(r2.x1, r1.y1, r1.x2, r2.y2, 1)
      end
      new_rects.unshift(new_rect) unless copied_rects.include?(new_rect)
    end
  end
  copied_rects = new_rects + copied_rects
end

pp copied_rects

exit

if rects[0].x2 >= rects[2].x1 && rects[0].y2 >= rects[2].y1
  rects << Rectangle.new(rects[0].x1, rects[0].y2, rects[2].x1, rects[2].y2, 1)
  rects << Rectangle.new(rects[0].x2, rects[0].y1, rects[2].x2, rects[2].y1, 1)
end
if rects[1].x2 >= rects[3].x1 && rects[0].y1 <= rects[3].y2
  rects << Rectangle.new(rects[1].x1, rects[3].y1, rects[3].x1, rects[1].y1, 1)
  rects << Rectangle.new(rects[1].x2, rects[3].y2, rects[3].x2, rects[1].y2, 1)
end
rects << [Rectangle.new(0, 0, w, h, 1)]

=begin

if (max(x1, x3) < min(x2, x4)) and (max(y1, y3) < min(y2, y4)):
    print('Yes Overlap!')
else:
    print('No')

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
※この問題は、2021年1月に開催されたP共通テスト（バンタンテックフォードアカデミー中高プログラミング共通テスト）で出題された問題です。

ソフトウェア会社で働いている太郎さんは、自社の 100 色ペイントソフトの塗りつぶし機能についての業務を任されました。

具体的な業務の内容は以下の通りです。





1. y 軸方向の長さが H, x 軸方向の長さが W である、上のような座標系の H × W のキャンバスを用意します。

はじめに、キャンバスは白色 (カラーコード 1番) で塗られており、 4 個の長方形が描かれています。

各長方形の 4 つの頂点の組は次の通りです。



・(0,0), (0,y_1), (x_1,y_1), (x_1,0) ＜図中赤色＞

・(0,H), (x_2,H), (x_2,y_2), (0,y_2) ＜図中青色＞

・(W,H), (W,y_3), (x_3,y_3), (x_3,H) ＜図中緑色＞

・(W,0), (x_4,0), (x_4,y_4), (W,y_4) ＜図中黄色＞



2. N 回塗りつぶしの操作をおこないます。

この操作では、キャンパスの端・長方形の辺で区切られている区画のうち、クリックした点と同じ区画を、選択したカラーコードの色で塗りつぶします。

i 回目の塗りつぶしでは、カラーコード C_i を選択した状態で点 (px_i, py_i) をクリックします。

既に色が塗られている区画を塗りつぶした場合、新しい色で上書きされることに注意してください。



3. 以下の形式の質問が Q 回与えられるので、その全てに回答してください。

「座標(qx_i, qy_i) の色はカラーコード何番ですか」

▼　下記解答欄にコードを記入してみよう

入力される値
N Q H W
x_1 y_1
x_2 y_2
x_3 y_3
x_4 y_4
C_1 px_1 py_1
...
C_N px_N py_N
qx_1 qy_1
...
qx_Q qy_Q

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・Q 行出力してください。
・Q 行のうち i 行目では、点 (qx_i, qy_i) に塗られている色のカラーコードを出力してください。
塗りつぶしがおこなわれていない点であっても、白のカラーコード 1 を出力することに注意してください。

条件
・入力は全て整数
・1 ≦ N ≦ 1,000
・1 ≦ Q ≦ 1,000
・2 ≦ H ≦ 100,000
・2 ≦ W ≦ 100,000
・0 < x_i < W(1 ≦ i ≦ 4)
・0 < y_i < H(1 ≦ i ≦ 4)
・1 ≦ C_i ≦ 100 (1 ≦ i ≦ N)
・0 < px_i < W(1 ≦ i ≦ N)
・0 < py_i < H(1 ≦ i ≦ N)
・(px_i, py_i) が線上（長方形の辺上・キャンパスの縁上）の点でないことが保証されている。
・0 < qx_i < W(1 ≦ i ≦ Q)
・0 < qy_i < H(1 ≦ i ≦ Q)
・(qx_i, qy_i) が線上（長方形の辺上・キャンパスの縁上）の点でないことが保証されている。

入力例1
10 10 100 100
70 50
30 80
50 40
20 90
2 10 30
3 60 45
4 35 95
5 10 60
6 25 85
7 70 95
8 10 85
9 80 10
10 35 20
11 15 30
1 1
1 51
7 99
31 81
90 10
95 95
35 95
25 20
40 51
51 45

出力例1
11
5
8
1
9
7
4
10
1
3
=end
