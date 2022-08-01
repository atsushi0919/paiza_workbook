# 指定された値の個数 (paizaランク D 相当)
# https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_value_step0

INPUT1 = <<~"EOS"
  5
  -3 2 0 -1 2
  2
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

def solve1(input_lines)
  n, *ary, k = input_lines.split.map(&:to_i)

  result = 0
  ary.each do |num|
    if num == k
      result += 1
    end
  end
  result
end

puts solve1(STDIN.read)
# puts solve1(INPUT1)
# > 2

def solve2(input_lines)
  n, *ary, k = input_lines.split.map(&:to_i)
  ary.count(k)
end

puts solve2(STDIN.read)
# puts solve2(INPUT1)
# > 2

=begin
指定された値の個数 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 n と、数列 a_1, ... , a_n と、整数 k が与えられます。

a_1, ... , a_n のうち k は何個あるかを求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
a_1 a_2 ... a_n
k

・ 1行目に、数列の長さを表す整数 n が与えられます。
・ 2行目に、数列の値 a_i が半角スペース区切りで与えられます。
・ 3行目に、整数 k が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
n 個の整数 a_1, ... , a_n のうち k が何個あるかを出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力は全て整数
・ 1 ≦ n ≦ 1,000
・ -100 ≦ a_i ≦ 100
・ -100 ≦ k ≦ 100

入力例1
5
-3 2 0 -1 2
2

出力例1
2
=end
