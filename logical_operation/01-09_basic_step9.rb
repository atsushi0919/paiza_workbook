# 全加算器 (paizaランク C 相当)
# https://paiza.jp/works/mondai/logical_operation/logical_operation__basic_step9

INPUT1 = <<~"EOS"
  0 0 0
EOS
OUTPUT1 = <<~"EOS"
  0 0
EOS

INPUT2 = <<~"EOS"
  0 0 1
EOS
OUTPUT2 = <<~"EOS"
  0 1
EOS

INPUT3 = <<~"EOS"
  0 1 0
EOS
OUTPUT3 = <<~"EOS"
  0 1
EOS

INPUT4 = <<~"EOS"
  0 1 1
EOS
OUTPUT4 = <<~"EOS"
  1 0
EOS

INPUT5 = <<~"EOS"
  1 0 0
EOS
OUTPUT5 = <<~"EOS"
  0 1
EOS

INPUT6 = <<~"EOS"
  1 0 1
EOS
OUTPUT6 = <<~"EOS"
  1 0
EOS

INPUT7 = <<~"EOS"
  1 1 1
EOS
OUTPUT7 = <<~"EOS"
  1 1
EOS

def solve(input_lines)
  a, b, c1 = input_lines.split.map { |n| n.to_i(2) }
  s = a ^ b ^ c1
  c2 = (a & b) | (a & c1) | (b & c1)
  [c2, s].join(" ")
end

puts solve(STDIN.read)

# S = (A ^ B) ^ C
#   = A ^ B ^ C
# C2= (A & B) | ((A ^ B) & C)
#   = (A & B) | (A & C) | (B & C)

# | a| b|c1||c2| s|
# | 0| 0| 0|| 0| 0|
# | 0| 0| 1|| 0| 1|
# | 0| 1| 0|| 0| 1|
# | 0| 1| 1|| 1| 0|
# | 1| 0| 0|| 0| 1|
# | 1| 0| 1|| 1| 0|
# | 1| 1| 0|| 1| 0|
# | 1| 1| 1|| 1| 1|

=begin
全加算器 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/logical_operation/logical_operation__basic_step9
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
京子ちゃんは 二進数 の整数同士で足し算をするプログラムを作成したいと思っています。
二進数の足し算において、下から 1 けた目の計算は半加算器でできることを知り、 2 けた目の計算も同じように足し算ができないかと考えています。



上記の画像のように、 現在下から 2, 3 けた目を計算しようとしています。そこで、入力 A, B と 1 けた目からの繰り上がり C1 が与えられます。 京子ちゃんに変わって C2 と S を計算し、出力してください。

この問題は少し難しいので、ヒントとなる画像を用意しました。 2 つの半加算器と XOR 演算を用いることで計算することができます。



▼　下記解答欄にコードを記入してみよう

入力される値
A B C1

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
C2, S をこの順に、半角スペース区切りで出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。


C2 S
条件
すべてのテストケースにおいて、以下の条件をみたします。

・ A, B, C1 は 0 または 1

入力例1
0 1 1

出力例1
1 0

入力例2
0 0 0

出力例2
0 0
=end
