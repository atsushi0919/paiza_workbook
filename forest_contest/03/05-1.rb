# 入出力例
INPUT1 = <<~"EOS"
  4
  333
  222
  444
  666
EOS
OUTPUT1 = <<~"EOS"
  333 444
EOS

INPUT2 = <<~"EOS"
  4
  111
  222
  333
  444
EOS
OUTPUT2 = <<~"EOS"
  multiple answers
EOS

INPUT3 = <<~"EOS"
  4
  800
  125
  310
  602
EOS
OUTPUT3 = <<~"EOS"
  no answer
EOS

def solve(input_str)
  bingo = 777
  n, *a = input_str.split.map(&:to_i)
  max_cnt = (1 << n) - 1

  result = "no answer"
  1.upto(max_cnt) do |i|
    bit = i.to_s(2).rjust(n, "0")
    tmp = []
    0.upto(n - 1) do |j|
      next if bit[j] == "0"
      tmp << a[j]
    end
    if tmp.sum == bingo
      if result == "no answer"
        result = tmp.sort.join(" ")
      else
        return "multiple answers"
      end
    end
  end
  result
end

puts solve(STDIN.read)

=begin
ラッキーナンバー (paizaランク B 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__b_lucky_number
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
与えられた数字を組み合わせて、ラッキーナンバー777を作ろうと考えました。

n個の自然数が与えられるので、足して777になる数字の組み合わせを見つけて、

それらの数字を小さい順に出力してください。

ただし、そのような組み合わせが複数ある場合には multiple answers
そのような組み合わせがない場合には no answer
を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます
n
x_1
x_2
...
x_n

・入力される自然数の数n
・x_1, x_2, ..., x_n は自然数
・入力はn + 1行となり、末尾に改行を一つ含みます。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
足して777になる組み合わせがある場合には、その数字を昇順にスペース区切りで出力してください。

ただし、そのような組み合わせが
・複数ある場合には、multiple answers
・存在しない場合には、no answer
を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≤ n ≤ 8
1 ≤ x_1, x_2, ..., x_n ≤ 1000

入力例1
4
333
222
444
666

出力例1
333 444

入力例2
4
111
222
333
444

出力例2
multiple answers

入力例3
4
800
125
310
602

出力例3
no answer
=end
