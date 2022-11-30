# 満員エレベーター (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__full_elevator

INPUT1 = <<~"EOS"
  2 100
  ride 3 50 50 50
  get_off 1
EOS
OUTPUT1 = <<~"EOS"
  1
  50
EOS

INPUT2 = <<~"EOS"
  4 123
  ride 1 130
  ride 2 10 100
  get_off 2
  ride 1 150
EOS
OUTPUT2 = <<~"EOS"
  0
  0
EOS

input_lines = $stdin.read.split("\n")
N, X = input_lines.shift.split.map(&:to_i)
Q = input_lines.shift(N)

gwt = 0
stack = []
Q.each do |req|
  ope, *params = req.split
  n, *wts = params.map(&:to_i)

  case ope
  when "ride"
    wts.each do |wt|
      break if gwt + wt > X
      gwt += wt
      stack.push(wt)
    end
  when "get_off"
    n.times { gwt -= stack.pop }
  end
end

puts [stack.length, gwt].join("\n")

=begin
paiza デパートには、各階を行き来する合計 X kg までの人を運ぶことができるエレベーターがありました。
店長はお客さんの流れを知るために、たくさんの乗り降りが行われるこのエレベーターの乗客の入れ替わりを調べることにしました。
エレベーターの乗り降りに関するデータが以下のいずれかの形式で時系列順に与えられるので、
全ての乗り降りが終わった後のエレベーター内の人数と合計体重を求めてください。
なお、初めエレベーターには誰も乗っていないものとします。

・ride N w_1 w_2 ... w_N
体重が w_1 kg の人から順に合計 N 人の人がエレベーターに乗る。
体重が w_i kg の人が乗ることで、エレベーターに乗っている人の体重の総和が X kg を超えてしまう場合、
体重が w_1 ... w_{i-1} の人たちがエレベーターに乗り、体重が w_i ... w_N の人たちはエレベーターに乗らない。

・get_off K
エレベーターに最後に乗った人から順に K 人が降りる。
具体的には、最後にエレベーターに乗った人, 最後から 2 番目にエレベーターに乗った人, ...,
最後から K 番目にエレベーターに乗った人といった順番で降りる。

▼　下記解答欄にコードを記入してみよう

入力される値
N X
Q_1
Q_2
...
Q_N


・1 行目では与えられる乗り降りの回数 N とエレベーターの重量制限についての値 X が半角スペース区切りで与えられます。
・2 行目からの N 行では、エレベーターの乗り降りの内容が時系列順に与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・全ての乗り降りが終わった時点でエレベーターに乗っている人数 num と乗っている人の体重の総和 sum を改行区切りで出力してください。


num
sum
条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ N ≦ 10000
・1 ≦ X ≦ 100000
・Q_i は次のいずれかの形式
「ride N w_1 w_2 ... w_N (1 ≦ N ≦ 30, 1 ≦ w_i ≦ 150, 1 ≦ i ≦ N)」
「get_off K (1 ≦ K ≦ min(30,その時点でのエレベーターに乗っている人数))」

入力例1
2 100
ride 3 50 50 50
get_off 1

出力例1
1
50

入力例2
4 123
ride 1 130
ride 2 10 100
get_off 2
ride 1 150

出力例2
0
0
=end
