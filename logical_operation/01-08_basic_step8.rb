# 半加算器 (paizaランク D 相当)
# https://paiza.jp/works/mondai/logical_operation/logical_operation__basic_step8

INPUT1 = <<~"EOS"
  0 1
EOS
OUTPUT1 = <<~"EOS"
  0 1
EOS

INPUT2 = <<~"EOS"
  1 1
EOS
OUTPUT2 = <<~"EOS"
  1 0
EOS

def solve(input_lines)
  a, b = input_lines.split.map { |n| n.to_i(2) }
  [a & b, a ^ b].join(" ")
end

puts solve(STDIN.read)

# | a| b|| c| s|
# | 0| 0|| 0| 0|
# | 0| 1|| 0| 1|
# | 1| 0|| 0| 1|
# | 1| 1|| 1| 0|


=begin
半加算器 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/logical_operation/logical_operation__basic_step8
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
京子ちゃんは 二進数 1 けたの整数 A と B を使って、 A + B を計算したいと思っています。



上記の画像のように、 A と B を足した結果 (2 進表記) の下から 2 けた目の値を C 、下から 1 けた目の値を S とします。 C と S を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
A B

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
C, S をこの順に、半角スペース区切りで出力してください。末尾に改行を入れ、余計な文字、空行を含んではいけません。


C S
条件
すべてのテストケースにおいて、以下の条件をみたします。

・ A, B は 0 または 1

入力例1
0 1

出力例1
0 1

入力例2
1 1

出力例2
1 0
=end
