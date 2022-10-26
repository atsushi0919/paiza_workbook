# 二次元データの区間探索 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__matrix_boss

INPUT1 = <<~"EOS"
  2 3 2 4
  1 2 3
  3 4 5
EOS
OUTPUT1 = <<~"EOS"
  1
EOS
INPUT2 = <<~"EOS"
  2 3 1 3
  1 2 3
  3 4 5
EOS
OUTPUT2 = <<~"EOS"
  4
EOS

def can_put?(a, y, x, size, reserve)
  0.upto(size - 1) do |dy|
    if a[y + dy][x..x + size - 1].find { |v| v > reserve }
      return false
    end
  end
  true
end

input_lines = STDIN.read.split("\n")
n, m, k, x = input_lines.shift.split.map(&:to_i)
a = input_lines.map { |l| l.split.map(&:to_i) }

cand_count = 0
0.upto(n - k) do |i|
  0.upto(m - k) do |j|
    cand_count += 1 if can_put?(a, i, j, k, x)
  end
end

puts cand_count

=begin
京子ちゃんは友人とピクニックに行く予定です。
行く予定の公園の敷地は南北 n メートル、東西 m メートルの長方形の形をしており、 n \* m 個の 1 辺 1 メートル正方形の区画で分けることができます。
ピクニックでは縦横 k メートルの大きさのレジャーシートを敷く予定です。
また公園の規則により、各区画には番号がついており、レジャーシートはあらかじめ予約した番号がついている区画にのみ敷くことができます。
京子ちゃんは 1, 2, 3, ..., x の番号がついている区画をすべて予約しました。レジャーシートを敷くことができる場所は何通りありますか？
ここで、レジャーシートの敷く場所が同じであるとは、レジャーシートが覆うすべての区画の集合が等しいことを意味します。
つまり、レジャーシートを回転させた場合でもレジャーシートの敷く場所は等しいと考えます。

▼　下記解答欄にコードを記入してみよう

入力される値
n m k x
a_1_1 a_1_2 ... a_1_m
a_2_1 a_2_2 ... a_2_m
...
a_n_1 a_n_2 ... a_n_m


・ 1 行目に、公園の大きさを表す整数 n, m とレジャーシートの一辺の長さ k と予約した番号の最大値 x が与えられます。
・ 2 行目から n + 1 行目にかけて、区画に書かれている番号 a_i_j が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
レジャーシートを敷くことができる場所の数を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ n, m ≦ 50
・ 1 ≦ k ≦ n
・ 1 ≦ k ≦ m
・ 1 ≦ a_i_j, x ≦ 1,000

入力例1
2 3 2 4
1 2 3
3 4 5

出力例1
1

入力例2
2 3 1 3
1 2 3
3 4 5

出力例2
4
=end
