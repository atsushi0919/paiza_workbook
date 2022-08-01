# 奇数の探索 (paizaランク D 相当)
# https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step1

INPUT1 = <<~"EOS"
  5
  1 3 5 6 8
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

def solve1(input_lines)
  n, *ary = input_lines.split.map(&:to_i)

  n.downto(1) do |i|
    return i if ary[i - 1] % 2 != 0
  end
end

puts solve1(STDIN.read)
# puts solve1(INPUT1)
# > 3

def solve2(input_lines)
  n, *ary = input_lines.split.map(&:to_i)

  n.downto(1).find { |i| ary[i - 1].odd? }
end

puts solve2(STDIN.read)
# puts solve2(INPUT1)
# > 3

=begin
奇数の探索 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_step1
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 n と、数列 a_1, ... , a_n が与えられます。

数列を先頭から順に見たときに、最後に現れる奇数が何番目にあるかを求めてください。最初の要素 (a_1) を 1 番目とします。

なお、与えられる数列には必ず奇数が含まれていることが保証されています。

▼　下記解答欄にコードを記入してみよう

入力される値
n
a_1 a_2 ... a_n

・ 1行目に、数列の長さを表す整数 n が与えられます。
・ 2行目に、数列の値 a_i が先頭から順に半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
数列を先頭から順に見たときに、最後に現れる奇数が何番目にあるかを出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力は全て整数
・ 1 ≦ n ≦ 1,000
・ 1 ≦ a_i ≦ 100

入力例1
5
1 3 5 6 8

出力例1
3
=end
