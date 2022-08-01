# 2番目に大きな値 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_kthmax_step0

INPUT1 = <<~"EOS"
  5
  -9 10 6 0 -3
EOS
OUTPUT1 = <<~"EOS"
  6
EOS

def solve1(input_lines)
  n, *ary = input_lines.split.map(&:to_i)

  2.times do |i|
    0.upto(n - 2 - i) do |j|
      if ary[j] > ary[j + 1]
        ary[j], ary[j + 1] = ary[j + 1], ary[j]
      end
    end
  end

  ary[-2]
end

puts solve1(STDIN.read)
# puts solve1(INPUT1)
# > 6

def solve2(input_lines)
  n, *ary = input_lines.split.map(&:to_i)

  ary.sort[-2]
end

puts solve2(STDIN.read)
# > puts solve2(INPUT1)
# > 6

def solve3(input_lines)
  n, *ary = input_lines.split.map(&:to_i)

  ary.max(2).last
end

puts solve3(STDIN.read)
# puts solve3(INPUT1)
# > 6

=begin
2番目に大きな値 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_kthmax_step0
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
整数 n と、数列 a_1, ... , a_n が与えられます。

数列に含まれる数のうち、2 番目に大きいものを出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
a_1 a_2 ... a_n

・ 1行目に、数列の長さを表す整数 n が与えられます。
・ 2行目に、数列の値 a_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
数列に含まれる数のうち、2 番目に大きいものを出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力は全て整数
・ 2 ≦ n ≦ 10,000
・ -1,000,000,000 ≦ a_i ≦ 1,000,000,000
・ i ≠ j ならば a_i ≠ a_j

入力例1
5
-9 10 6 0 -3

出力例1
6
=end
