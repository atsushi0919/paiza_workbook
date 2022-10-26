# ピクニック (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__matrix_step2

INPUT1 = <<~"EOS"
  2 3
  1 2 2
  3 2 2
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  2 3
  2 2 2
  2 2 2
EOS
OUTPUT2 = <<~"EOS"
  2
EOS

INPUT3 = <<~"EOS"
  1 4
  1 1 1 1
EOS
OUTPUT3 = <<~"EOS"
  0
EOS

INPUT4 = <<~"EOS"
  3 3
  2 2 2
  2 2 2
  1 2 2
EOS
OUTPUT4 = <<~"EOS"
  3
EOS

def flat?(a, y, x, size)
  base_h = a[y][x]
  0.upto(size - 1) do |dy|
    unless a[y + dy][x..x + size - 1].all?(base_h)
      return false
    end
  end
  true
end

size = 2
input_lines = STDIN.read.split("\n")
n, m = input_lines.shift.split.map(&:to_i)
a = input_lines.map { |l| l.split.map(&:to_i) }

cand_count = 0
0.upto(n - size) do |i|
  0.upto(m - size) do |j|
    cand_count += 1 if flat?(a, i, j, size)
  end
end

puts cand_count

=begin
京子ちゃんは友人と 4 人で山へピクニックに行く予定です。
行く予定の山の敷地は南北 n メートル、東西 m メートルの長方形の形をしており、 n \* m 個の 1 辺 1 メートル正方形の区画で分けることができます。
北から i 番目、西から j 番目の区画を(i, j) と表し、(i, j) の標高を a_i_j とします。
また、ピクニックではレジャーシートを敷く予定です。レジャーシートは縦 2 メートル、横 2 メートルの大きさで、南北に平行に敷きます。
京子ちゃんたちはレジャーシートを地面と平行な場所に敷きたいので、
a_i_j = a\_{ i + 1 }\_j = a_i\_{ j + 1 } = a\_{ i + 1 }\_{ j + 1 }となる場所を探しています。このような場所は何通りあるでしょうか？

▼　下記解答欄にコードを記入してみよう

入力される値
n m
a_1_1 a_1_2 ... a_1_m
a_2_1 a_2_2 ... a_2_m
...
a_n_1 a_n_2 ... a_n_m


・ 1 行目に、山の敷地の大きさを表す整数 n, m が与えられます。
・ 2 行目から n + 1 行目にかけて、各区画の標高 a_i_j の各要素が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
レジャーシートを地面と平行に置ける場所の数を出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 1 ≦ n, m ≦ 100
・ 1 ≦ a_i_j ≦ 100

入力例1
2 3
1 2 2
3 2 2

出力例1
1

入力例2
2 3
2 2 2
2 2 2

出力例2
2

入力例3
1 4
1 1 1 1

出力例3
0
=end
