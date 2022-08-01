# 【特殊な探索】成績優秀者の列挙 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_boss

INPUT1 = <<~"EOS"
  5
  alice 97
  bob 25
  carol 57
  dave 46
  ellen 10
  35 80
EOS
OUTPUT1 = <<~"EOS"
  carol
  dave
EOS

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  ary = input_lines.shift(n).map do |l|
    name, score = l.split
    [name, score.to_i]
  end
  k, l = input_lines.shift.split.map(&:to_i)

  result = []
  ary.each do |name, score|
    result << name if k <= score && score <= l
  end

  result
end

puts solve(INPUT1)

def solve(input_lines)
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  hash = input_lines.shift(n).map do |l|
    name, score = l.split
    [name, score.to_i]
  end
  hash = hash.to_h
  k, l = input_lines.shift.split.map(&:to_i)

  hash.select { |name, score| k <= score && score <= l }.keys
end

puts solve(STDIN.read)

=begin
【特殊な探索】 成績優秀者の列挙 2 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/sequence_search_problems/sequence_search_problems_search_condition_boss
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
n 人の生徒がテストを受けました。このテストで k 点以上 l 点以下の点数を取った人が合格です。

n 人の各生徒について、その人の名前とその人が取った点数が入力として与えられるので、このテストに合格した人の名前をすべて、入力された順に改行区切りで出力してください。

なお、合格者が一人もいない場合は、何も出力しないでください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
s_1 t_1
s_2 t_2
...
s_n t_n
k l

・ 1行目に、生徒の人数を表す整数 n が与えられます。
・ 続く n 行のうち i 行目に、i 番目の生徒の名前 s_i とその生徒の得点 t_i が半角スペース区切りで与えられます。
・ n+2 行目に、合格点の基準を表す整数 k, l が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
テストに合格した人の名前をすべて、入力された順に改行区切りで出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

なお、合格者が一人もいない場合は、何も出力しないでください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力は s_i を除いて全て整数
・ 1 ≦ n ≦ 100
・ s_i は英小文字 'a', 'b', ... , 'z' からなる1文字以上10文字以下の文字列
・ i ≠ j ならば s_i ≠ s_j
・ 0 ≦ t_i ≦ 100
・ 1 ≦ k, l ≦ 100
・ k ≦ l

入力例1
5
alice 97
bob 25
carol 57
dave 46
ellen 10
35 80

出力例1
carol
dave
=end
