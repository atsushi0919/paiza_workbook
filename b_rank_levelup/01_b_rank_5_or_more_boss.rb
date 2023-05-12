# 5以上の整数の合計 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prob60/5_or_more_9

INPUT1 = <<~"EOS"
  1
  3
EOS
OUTPUT1 = <<~"EOS"
  0
EOS

INPUT2 = <<~"EOS"
  5
  1
  -5
  1
  4
  3
EOS
OUTPUT2 = <<~"EOS"
  0
EOS

INPUT3 = <<~"EOS"
  9
  2
  -3
  -3
  4
  -1
  6
  4
  5
  8
EOS
OUTPUT3 = <<~"EOS"
  19
EOS

def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split.map(&:to_i)
  n = input_lines.shift
  ary = input_lines.shift(n)

  # 配列 ary の値が5以上なら result に足す
  result = 0
  ary.each do |num|
    if num >= 5
      result += num
    end
  end

  # 文字列型に変換して末尾に改行を追加する
  result.to_s << "\n"
end

puts solve(STDIN.read)

exit

=begin
def solve(input_lines)
  n, *ary = input_lines.split.map(&:to_i)
  result = 0
  ary.each { |num| result += num if num >= 5 }
  result
end
=end

def solve(input_lines)
  n, *ary = input_lines.split.map(&:to_i)
  ary.select { |num| num >= 5 }.sum
end

puts solve(STDIN.read)

=begin
5以上の整数の合計 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/5_or_more_9
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
改行区切りで整数がn個入力されるので、n個の整数のうち、5以上のものをすべて足し合わせた値を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

n (数字の総数)
a_1
a_2
a_3
...
a_i
...
a_n


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
入力された整数a_iのうち5以上のものをすべて足し合わせた値を出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≦ n ≦ 1,000
-1,000,000 ≦ a_i ≦ 1,000,000

入力例1
1
3

出力例1
0

入力例2
5
1
-5
1
4
3

出力例2
0

入力例3
9
2
-3
-3
4
-1
6
4
5
8

出力例3
19
=end
