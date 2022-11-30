# 3 つのスタック (paizaランク C 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__three_stack

INPUT1 = <<~"EOS"
  5
  push 1 5
  push 2 3
  push 3 1
  pop 2
  pop 1
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  7
  push 1 1
  push 1 1
  push 1 1
  push 2 2
  push 2 4
  pop 1
  push 3 3
EOS
OUTPUT2 = <<~"EOS"
  1
  1
  4
  2
  3
EOS

NOS = 3
stacks = Array.new(NOS) { [] }
_, *Q = $stdin.read.split("\n")

Q.each do |req|
  ope, *args = req.split
  i, val = args.map(&:to_i)
  i -= 1

  case ope
  when "push"
    stacks[i].push(val)
  when "pop"
    stacks[i].pop
  end
end

stacks.each do |stack|
  until stack.empty?
    puts stack.pop
  end
end

=begin
まずはスタックを扱う練習として 3 つのスタックを用意して、それらに基本操作を行いましょう。
はじめ 3 つのスタックは空です。
次のいずれかの指示が N 回与えられるので、入力された順番に指示通りの操作をしてください。
全ての指示が終わった後、各スタックに含まれる要素を上から順に出力してください。

・push S X
S 番目のスタックに X を追加する。

・pop S
S 番目のスタックの一番上の要素を取り出す。
スタックの要素が存在しない場合は何もしない。

▼　下記解答欄にコードを記入してみよう

入力される値
N
Q_1
Q_2
...
Q_N


・1 行目では与えられる指示の回数 N が与えられます。
・2 行目からの N 行では、スタックの操作の指示が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・3 つのスタックの要素を次の順番で改行区切りで出力してください。
・スタックが空の場合は何も出力しないでください。


1 つ目のスタックの一番上の要素
→...
→1 つ目のスタックの一番下の要素
→2 つ目のスタックの一番上の要素
→...
→2 つ目のスタックの一番下の要素
→3 つ目のスタックの一番上の要素
→...
→3 つ目のスタックの一番下の要素
条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ N ≦ 10000
・Q_i は次のいずれかの形式（1 ≦ i ≦ N）
「push S X (1 ≦ S ≦ 3, 1 ≦ X ≦ 10000)」
「pop S(1 ≦ S ≦ 3)」
・空のスタックから要素を取り出すような pop は与えられないことが保証されている。

入力例1
5
push 1 5
push 2 3
push 3 1
pop 2
pop 1

出力例1
1

入力例2
7
push 1 1
push 1 1
push 1 1
push 2 2
push 2 4
pop 1
push 3 3

出力例2
1
1
4
2
3
=end
