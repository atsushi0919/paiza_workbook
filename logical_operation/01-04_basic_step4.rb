# 排他的論理和( XOR )の基本 (paizaランク D 相当)
# https://paiza.jp/works/mondai/logical_operation/logical_operation__basic_step4

INPUT1 = <<~"EOS"
  0 0
EOS
OUTPUT1 = <<~"EOS"
  0
EOS

INPUT2 = <<~"EOS"
  0 1
EOS
OUTPUT2 = <<~"EOS"
  1
EOS

def solve(input_lines)
  a, b = input_lines.split.map { |n| n.to_i(2) }
  a ^ b
end

puts solve(STDIN.read)

# | a| b|| s|
# | 0| 0|| 0|
# | 0| 1|| 1|
# | 1| 0|| 1|
# | 1| 1|| 0|

=begin
排他的論理和( XOR )の基本 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/logical_operation/logical_operation__basic_step4
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
0 または 1 の整数 A と B が与えられます。 A XOR B の結果を出力してください。


ここで、 XOR 演算とは、以下の表にしたがって算出する論理演算のことを指します。



入力 1	入力 2	出力
0	0	0
0	1	1
1	0	1
1	1	0
▼　下記解答欄にコードを記入してみよう

入力される値
A B

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
A XOR B の結果を 0 または 1 で出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ A, B は 0 または 1

入力例1
0 0

出力例1
0

入力例2
0 1

出力例2
1
=end
