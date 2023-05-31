# グループ企業 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dag_memoization_search/dag_memoization__problems_step3

INPUT1 = <<"EOS"
7 7
3 7 6 1 2 5 4
0 1
0 2
1 4
2 3
2 5
3 6
0
1
2
3
4
5
6
EOS
OUTPUT1 = <<"EOS"
7
7
6
4
2
5
4
EOS

# 会社の情報
Company = Struct.new(:profit, :p_profit, :parent, :subsidaries)
# 入力
# input_lines = $stdin.read.split("\n")
input_lines = INPUT1.split("\n")
n, q = input_lines.shift.split.map(&:to_i)
r = input_lines.shift.split.map(&:to_i)
cd = input_lines.shift(n - 1).map { |r| r.split.map(&:to_i) }
rq = input_lines.shift(q).map(&:to_i)

# 会社の親子関係
companies = r.map { |r_i| Company.new(r_i, nil, nil, []) }
cd.each do |p_i, s_i|
  companies[p_i].subsidaries <<= s_i
  companies[s_i].parent = p_i
end

# 公表する収益の計算
search_list = companies.select { |c| c.subsidaries.empty? }
while search_list.length > 0
  company = search_list.pop

  # company が決算済みならスキップ
  next if company.p_profit

  if company.subsidaries.empty?
    # 子会社を持たない企業
    company.p_profit = company.profit
  else
    sub_p_profits = company.subsidaries.map { |i| companies[i].p_profit }
    if sub_p_profits.include?(nil)
      # 未決算の子会社ありなら決算を後回し
      search_list.unshift(company)
      next
    else
      # 全ての子会社が決算済みなら company も決算する
      company.p_profit = sub_p_profits.push(company.profit).max
    end
  end

  # 親会社があるなら親会社を探索リスト末尾に入れる
  search_list.push(companies[company.parent]) if company.parent
end

# rq の要素に対応した会社の公表利益を出力
puts rq.map { |i| companies[i].p_profit }.join("\n")

=begin
グループ企業 G は N 社が所属しており、親会社(会社 0 )と N - 1 個の子会社(会社 1, 会社 2, ...)を含みます。
これらの会社間には親子関係が合計で N - 1 個存在し、会社 C_i の子会社は会社 D_i です。各会社の収益は以下の条件にしたがって計算されます。

会社 0 以外のすべての会社はただ一つの親会社を持ちます。

会社 i の収益は R_i ですが、少ないと株価が下がりそうで少し不安です。
そこで、会社 i の収益は代わりに Max( 会社 i の収益, 会社 i の子会社の収益, 会社 i の子会社の子会社の収益, ...)を公表することにします。
つまり、自社の子会社すべての収益の最大値を公表します。



Q 回のクエリが与えられます。以上の条件にしたがうとき、会社 q_i が公表する収益を答えてください。
▼　下記解答欄にコードを記入してみよう

入力される値
N Q
R_0 R_1 R_2 ... R_(N-1)
C_0 D_0
...
C_(N-2) D_(N-2)
q_0
q_1
...
q_(Q-1)


・ 1 行目に、グループ企業に所属している会社の数 N とクエリの数 Q が与えられます。
・ 2 行目に、各企業の実際の収益 R_i が与えられます。
・ 3 行目から N + 1 行目にかけて、 2 つの会社 C_i と D_i の親子関係が与えられます。会社 C_i の子会社は会社 D_i です。
・ N + 2 行目から Q 行にかけて、クエリ q_i が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
Q 回のクエリが与えられます。 i 回目のクエリでは会社 q_i が公表する収益を答えてください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ N ≦ 10,000
・ 1 ≦ Q ≦ 10,000
・ 0 ≦ R_i < 10,000
・ 0 ≦ C_i ≦ N - 1
・ 1 ≦ D_i ≦ N - 1
・ 0 ≦ q_i ≦ N - 1
・ 会社 0 以外のすべての会社はただ一つの親会社を持つ
・ 会社の親子関係に矛盾が生じるような入力は与えられない

入力例1
7 7
3 7 6 1 2 5 4
0 1
0 2
1 4
2 3
2 5
3 6
0
1
2
3
4
5
6

出力例1
7
7
6
4
2
5
4
=end
