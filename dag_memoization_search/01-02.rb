# グループ企業 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/dag_memoization_search/dag_memoization__problems_step2

INPUT1 = <<"EOS"
7 7
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
2
4
2
1
1
1
EOS

# 会社の情報
Company = Struct.new(:id, :profit, :parent, :subsidaries)
# 入力
input_lines = $stdin.read.split("\n")
n, q = input_lines.shift.split.map(&:to_i)
cd = input_lines.shift(n - 1).map { |r| r.split.map(&:to_i) }
rq = input_lines.shift(q).map(&:to_i)

# 会社の親子関係
companies = 0.upto(n - 1).map { |id| Company.new(id, nil, nil, []) }
cd.each do |p_i, s_i|
  companies[p_i].subsidaries <<= s_i
  companies[s_i].parent = p_i
end

# 収益の計算
search_list = companies.select { |c| c.subsidaries.empty? }
while search_list.length > 0
  company = search_list.pop

  # company が決算済みならスキップ
  next if company.profit

  if company.subsidaries.empty?
    # 子会社を持たない企業
    company.profit = 1
  else
    sub_profits = company.subsidaries.map { |i| companies[i].profit }
    if sub_profits.include?(nil)
      # 未決算の子会社ありなら決算を後回し
      search_list.unshift(company)
      next
    else
      # 全ての子会社が決算済みなら company も決算する
      company.profit = sub_profits.sum + 1
    end
  end

  # 親会社があるなら親会社を探索リスト末尾に入れる
  search_list.push(companies[company.parent]) if company.parent
end

# rq の要素に対応した会社の利益を出力
puts rq.map { |i| companies[i].profit }.join("\n")

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
グループ企業 G は N 個の会社が所属しており、親会社(会社 0 )と N - 1 個の子会社(会社 1, 会社 2, ...)を含みます。
これらの会社間には親子関係が合計で N - 1 個存在し、会社 s_i の子会社は会社 D_i です。各会社の収益は以下の条件にしたがって計算されます。



会社 0 以外のすべての会社はただ一つの親会社を持ちます。

子会社が存在しない会社の収益は 1 です。

子会社が存在する会社の収益は、直属のすべての子会社の収益の和 +1 です。



Q 回のクエリが与えられます。 i 回目のクエリでは会社 q_i の収益を答えてください。
▼　下記解答欄にコードを記入してみよう

入力される値
N Q
C_1 D_1
...
C_(N-1) D_(N-1)
q_1
q_2
...
q_Q


・ 1 行目に、グループ企業に所属している会社の数 N とクエリの数 Q が与えられます。
・ 2 行目から N 行目にかけて、 2 つの会社 s_i と D_i の親子関係が与えられます。会社 s_i の子会社は会社 D_i です。
・ N + 1 行目から Q 行にかけて、クエリ q_i が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
Q 回のクエリが与えられます。 i 回目のクエリでは会社 q_i の収益を答えてください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ N ≦ 10,000
・ 1 ≦ Q ≦ 10,000
・ 0 ≦ s_i ≦ N - 1
・ 1 ≦ D_i ≦ N - 1
・ 0 ≦ q_i ≦ N - 1
・ 会社 0 以外のすべての会社はただ一つの親会社を持つ
・ 会社の親子関係に矛盾が生じるような入力は与えられない

入力例1
7 7
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
2
4
2
1
1
1
=end
