# 【指定された値の探索】指定された値の位置 3 (paizaランク D 相当)
# https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_value_boss

INPUT1 = <<~"EOS"
  5
  -3 2 0 -1 2
  2
EOS
OUTPUT1 = <<~"EOS"
  2
  5
EOS

def solve(input_lines)
  n, *ary, k = input_lines.split.map(&:to_i)

  result = []
  1.upto(n) do |i|
    if ary[i - 1] == k
      result << i
    end
  end
  result
end

# puts solve(STDIN.read)
# puts solve(INPUT1)
# > 2
# > 5

def solve(input_lines)
  n, *ary, k = input_lines.split.map(&:to_i)

  1.upto(n).select { |i| ary[i - 1] == k }
end

puts solve(STDIN.read)

# puts solve(INPUT1)
# > 2
# > 5

=begin
【指定された値の探索】指定された値の位置 3 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_value_boss
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 n と、数列 a_1, ... , a_n と、整数 k が与えられます。

整数 k が数列の何番目にあるかを求めてください。最初の要素 (a_1) を 1 番目とします。

数列に整数 k が複数含まれている場合は、そのすべてについて何番目にあるかを求め、数列を先頭から見たときに現れる順にすべて出力してください。

ただし、整数 k が数列に含まれていない場合は、何も出力しないでください。

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
数列に含まれるすべての整数 k について、それぞれ何番目にあるかを、数列を先頭から見たときに現れる順に、改行区切りで出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

ただし、整数 k が数列に含まれていない場合は、何も出力しないでください。

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
5
=end
