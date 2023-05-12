# 足すか掛けるか (paizaランク C 相当)
# https://paiza.jp/works/mondai/prob60/total_value_9

INPUT1 = <<~"EOS"
  5
  2 1
  3 6
  4 2
  4 4
  4 70
EOS
OUTPUT1 = <<~"EOS"
  108
EOS

INPUT2 = <<~"EOS"
  1
  0 0
EOS
OUTPUT2 = <<~"EOS"
  0
EOS

INPUT3 = <<~"EOS"
  3
  1 2
  3 4
  5 6
EOS
OUTPUT3 = <<~"EOS"
  21
EOS

def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary = []
  input_lines.shift(n).each do |line|
    ary.push(line.split.map(&:to_i))
  end

  # 確認用コード
  [n, ary]
end

p solve(INPUT1)
# > [5, [[2, 1], [3, 6], [4, 2], [4, 4], [4, 70]]]
p solve(INPUT2)
# > [1, [[0, 0]]]
p solve(INPUT3)
# > [3, [[1, 2], [3, 4], [5, 6]]]

exit

=begin
def solve(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary = []
  input_lines.shift(n).each do |line|
    ary.push(line.split.map(&:to_i))
  end

  result = 0
  ary.each do |a, b|
    if a == b
      result += a * b
    else
      result += a + b
    end
  end
  result
end
=end

def solve(input_lines)
  _, *lines = input_lines.split("\n")

  result = lines.map { |line|
    a, b = line.split.map(&:to_i)
    a == b ? a * b : a + b
  }.sum

  result.to_s << "\n"
end

puts solve(STDIN.read)

=begin
足すか掛けるか (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/total_value_9
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
2つの整数の組がn個与えられるので、各組の計算結果を足し合わせたものを出力してください。
各組の計算結果は次の値です。
・2つの整数の組を足し合わせたもの
・ただし、2つの整数が同じ値だった場合は、掛け合わせたもの

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

n
a_1 b_1
...
a_n b_n

nは与えられる整数の組の行数です。
a_iとb_iはそれぞれが整数です。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
各行の計算結果を足し合わせた値を出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件を満たします。

1 ≦ n ≦ 50
-100,000 ≦ a_n ≦ 100,000
-100,000 ≦ b_n ≦ 100,000

入力例1
5
2 1
3 6
4 2
4 4
4 70

出力例1
108

入力例2
1
0 0

出力例2
0

入力例3
3
1 2
3 4
5 6

出力例3
21
=end
