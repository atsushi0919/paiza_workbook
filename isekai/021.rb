# ソートと検索 (query)

INPUT1 = <<"EOS"
3 3 176
118
174
133
join 137
join 177
sorting
EOS

OUTPUT1 = <<"EOS"
5
EOS

INPUT2 = <<"EOS"
10 10 145
169
164
162
112
191
168
168
199
176
146
join 196
join 142
sorting
sorting
join 131
join 140
sorting
sorting
join 143
sorting
EOS
OUTPUT2 = <<"EOS"
3
3
5
5
6
EOS

input_lines = $stdin.read.split("\n")
n, k, paiza = input_lines.shift.split.map(&:to_i)
a = input_lines.shift(n).map(&:to_i) << paiza
q = input_lines.shift(k)

q.each do |event|
  if event.include?("join")
    a << event.split[-1].to_i
  else
    a.sort!
    puts a.index(paiza) + 1
  end
end

=begin
paiza 君のクラスには paiza 君を含めて N + 1 人の生徒がいます。paiza 君の身長は P cm で、他の N 人の生徒の身長はそれぞれ A_1 ... A_N です。
このクラスには次のようなイベントが合計 K 回起こります。
それぞれのイベントは以下のうちのいずれかです。

・転校生がクラスに加入する
・全員で背の順に並ぶ

全員で背の順で並ぶイベントが起こるたびに、そのとき paiza 君は前から何番目に並ぶことになるかを出力してください。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

N K P

A_1

...

A_N

event_1

...

event_K
・1 行目では、paiza 君を除いたクラスの人数 N と起こるイベントの回数 K と paiza君の身長 P が与えられます。
・続く N 行では、初めにクラスにいる N 人の生徒の身長が与えられます。
・続く K 行では、起こるイベントを表す文字列が与えられます。

条件
・1 ≦ N , K ≦ 100,000
・100 ≦ P ≦ 200
・100 ≦ A_i ≦ 200 (1 ≦ i ≦ N)
・転校生を含め、クラスの中で P cm の生徒は paiza 君のみであることが保証されている
・event_i (1 ≦ i ≦ K) は以下のいずれかの形式で与えられる。


join num

身長 num(cm) の生徒がクラスに加入したことを表す。
sorting

生徒が背の順に並ぶことを表す
この入力が与えられるたび、paiza 君が背の順で前から何番目に並ぶことになるかを出力してください。
出力される値
・全員で背の順で並ぶイベントが起こるたびに、paiza 君が前から何番目に並ぶことになるかを出力してください。
・また、出力の末尾には改行を入れてください。

入力例
3 3 176
118
174
133
join 137
join 177
sorting

出力例
5
=end
