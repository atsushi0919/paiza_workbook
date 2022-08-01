INPUT1 = <<~"EOS"
  5 12
  5 9 7 6 7
EOS
OUTPUT1 = <<~"EOS"
  2.3333333333
EOS

INPUT2 = <<~"EOS"
  5 3
  5 9 7 6 7
EOS
OUTPUT2 = <<~"EOS"
  7.0000000000
EOS

def count_trimmed_pipes(length, pipes)
  num_of_trimmed_pipes = 0
  pipes.each do |n|
    num_of_trimmed_pipes += (n / length).floor
  end
  num_of_trimmed_pipes
end

def solve(input_lines)
  n, k, *pipes = input_lines.split.map(&:to_i)

  left = 0
  right = last_length = pipes.max * 2
  while 1
    pipe_length = (left + right) / 2.0
    pipe_count = count_trimmed_pipes(pipe_length, pipes)
    if pipe_count < k
      right = pipe_length
    else
      if (last_length - pipe_length).abs < 1.0e-10
        return "%.10f" % pipe_length
      end
      left = pipe_length
    end
    last_length = pipe_length
  end
end

puts solve(STDIN.read)

=begin


パイプを切り出そう (paizaランク A 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/binary_search/binary_search__application_step0
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
n 本のパイプがあり、長さはそれぞれ A_1, A_2, ..., A_n です。
今、n 本のパイプから k 本の同じ長さのパイプを切り出すことを考えます。
パイプを切って分割することはできますが、つなげることはできません。

パイプの切り方を工夫した結果、切り出すことができるパイプの長さの最大値を答えてください。

答えは整数になるとは限りません。相対誤差または絶対誤差が 10^-6 (0.000001) 以下であれば正解とみなされます。

▼　下記解答欄にコードを記入してみよう

入力される値
n k
A_1 A_2 ... A_n

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
n 本のパイプから k 本のパイプを適切に切り出した結果、切り出すことができるパイプの長さの最大値を出力してください。
相対誤差または絶対誤差が 10^-6 (0.000001) 以下であれば正解とみなされます。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。



・ 入力はすべて整数

・ 1 ≦ n ≦ 200,000

・ 1 ≦ k ≦ 500,000

・ 1 ≦ A_i ≦ 10,000 (1 ≦ i ≦ n)

入力例1
5 12
5 9 7 6 7

出力例1
2.3333333333

入力例2
5 3
5 9 7 6 7

出力例2
7.0000000000
=end
