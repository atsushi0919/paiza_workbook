# 仕事の順序 (paizaランク A 相当)
# https://paiza.jp/works/mondai/dag_memoization_search/dag_memoization__problems_step1

INPUT1 = <<"EOS"
6 7
1 2
2 6
1 4
4 6
1 3
3 5
5 6
EOS
OUTPUT1 = <<"EOS"
3
EOS

INPUT2 = <<"EOS"
6 7
1 2
1 3
2 4
3 4
3 5
4 6
5 6
EOS
OUTPUT2 = <<"EOS"
3
EOS

INPUT3 = <<"EOS"
4 5
1 2
1 3
2 3
2 4
3 4
EOS
OUTPUT3 = <<"EOS"
3
EOS

# 入力
input_lines = $stdin.read.split("\n")
n, k = input_lines.shift.split.map(&:to_i)
jw = input_lines.shift(k).map { |r| r.split.map(&:to_i) }

# 仕事 n の前の仕事を指す隣接リスト (仕事番号を index に合わせる)
ad_list = Array.new (n) { [] }
n -= 1
jw.each { |j, w| ad_list[w - 1] << j - 1 }

# 仕事の順序を調べる
num_of_flows = 0
search_list = [n]
while search_list.length > 0
  work = search_list.pop
  prev = ad_list[work]

  prev.empty? ? num_of_flows += 1 : search_list.concat(prev)
end

# 出力
puts num_of_flows

=begin
ぱいじょ株式会社で働いている京子ちゃんは、 N 個の仕事を抱えています。
i 番目の仕事を仕事 i と呼びます。仕事には k 個の順序関係があり、仕事 J_i が終わると、仕事 W_i に取り掛かることができます。
仕事 N に取り掛かるために、取り組む必要のある仕事の順序は何通りありますか？
答えは非常に大きくなることがあるので、 1,000,000,007 で割ったあまりを出力してください。

ここで、取り組む仕事の順序 A と B が異なるとは以下の場合のことを指します。


仕事の順序 A で取り組む仕事を順に X_1, X_2, ... X_N とし、仕事の順序 B で取り組む仕事を順に Y_1, Y_2, ... Y_M とします。
N ≠ M または X_i ≠ Y_i となる i が存在する場合



また、それぞれの仕事は適切な順序で必ず取り掛かることができ、すべての仕事に取り組む必要はありません。
▼　下記解答欄にコードを記入してみよう

入力される値
N k
J_1 W_1
J_2 W_2
...
J_k W_k


・ 1 行目に、仕事の総数 N と仕事の順序関係の個数 k が与えられます。
・ 2 行目から k + 1 行目にかけて、 J_i と W_i が与えられます。仕事 J_i が終わると、仕事 W_i に取り掛かることができます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
仕事 N に取り掛かるために、取り組む必要のある仕事の順序は何通りありますか？答えは非常に大きくなることがあるので、 1,000,000,007 で割ったあまりを出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ N ≦ 10,000
・ N - 1 ≦ k ≦ Min(N * (N - 1 ) / 2, 100,000 )
・ 1 ≦ J_i < W_i ≦ N
・ J_i ≠ W_i
・ J_i = J_j かつ W_i = W_j となる i, j の組み合わせは存在しない
・ それぞれの仕事は適切な順序で必ず取り掛かることができる

入力例1
6 7
1 2
2 6
1 4
4 6
1 3
3 5
5 6

出力例1
3

入力例2
6 7
1 2
1 3
2 4
3 4
3 5
4 6
5 6

出力例2
3

入力例3
4 5
1 2
1 3
2 3
2 4
3 4

出力例3
3
=end
