# 検索 (paizaランク B 相当)
# https://paiza.jp/works/mondai/bfs_dfs_problems_advanced/bfs_dfs_problems_advanced__search

INPUT1 = <<"EOS"
5 4 1 10 2
1 2 2 1 2
1 2
2 3
2 4
4 5
EOS
OUTPUT1 = <<"EOS"
2
2
3
EOS

# 施設間の距離 5km
DIST = 5

# 入力
input_lines = $stdin.read.split("\n")
n, m, x, y, z = input_lines.shift.split.map(&:to_i)
c = input_lines.shift.split.map(&:to_i)
a_b = input_lines.shift(m).map { |e| e.split.map(&:to_i) }

# 隣接リスト（施設番号は添え字に合わせる）
ad_list = Array.new(n) { [] }
a_b.each do |a, b|
  ad_list[a - 1] <<= b - 1
  ad_list[b - 1] <<= a - 1
end

# x 施設からスタート
search_list = [x - 1]
visited = Array.new(n, false)
results = []
# BFS
(y / DIST + 1).times do
  new_list = []
  while search_list.length > 0
    # 現在の施設を調べる
    cf = search_list.shift
    # 探索済み確認
    visited[cf] ? next : visited[cf] = true
    # 施設の種類が z なら記録
    results << cf + 1 if cf != x - 1 && c[cf] == z

    # 隣接施設が未訪問なら探索リストに追加
    ad_list[cf].each { |nf| visited[nf] ? next : new_list << nf }
  end
  # 次の探索リストをセット
  search_list = new_list
end

# 出力
puts results.length
puts results.sort.join("\n")

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
1 から n までの番号が付けられた n 個の施設と、それらを結ぶ m 本の道路が与えられます。
施設 i の種類は c_i です。また、j 番目の道路は施設 a_j と施設 b_j を結んでおり、その距離は 5 km です。
これら以外に道路はないものとします。

この地図において、x 番目の施設から最短距離 y km 以内にある、種類が z の施設の番号を昇順ですべて出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n m x y z
c_1 c_2 ... c_n
a_1 b_1
...
a_m b_m

・ 1 行目に、施設の個数を表す整数 n, 道路の本数を表す整数 m, 基準になる施設の番号を表す整数 x, 距離 y,
検索する施設の種類 z が半角スペース区切りで与えられます。
・ 2 行目に、施設の種類 c_i が半角スペース区切りで与えられます。(1 ≦ i ≦ n)
・ 続く m 行では、施設の番号の組 a_j, b_j が半角スペース区切りで与えられます。(1 ≦ j ≦ m)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
答えとなる施設の個数を k として、合計 k + 1 行出力してください。

1 行目には、答えとなる施設の個数 k を出力してください。
続く k 行には、答えとなる施設を、施設の番号の昇順で改行区切りですべて出力してください。

また、末尾に改行を入れ、余計な文字を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 2 ≦ n ≦ 100,000 = 10^5
・ n - 1 ≦ m ≦ min(n × (n - 1) / 2, 100,000 = 10^5)
・ 1 ≦ y ≦ 500,000 = 5 × 10^5
・ 1 ≦ x, z, c_i ≦ n
・ 1 ≦ a_i, b_i ≦ n
・ a_i ≠ b_i
・ (a_i, b_i) ≠ (a_j, b_j), (a_i, b_i) ≠ (b_j, a_j) (i ≠ j)
・ 与えられるグラフは連結である

入力例1
5 4 1 10 2
1 2 2 1 2
1 2
2 3
2 4
4 5

出力例1
2
2
3
=end
