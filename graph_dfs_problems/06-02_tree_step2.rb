# 全域木の出力 (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__tree_step2

INPUT1 = <<~"EOS"
  4
  1
  2
  3
  1 3 4
  2
  2 4
  2
  2 3
EOS
OUTPUT1 = <<~"EOS"
  1 2
  2 3
  3 4
EOS

INPUT2 = <<~"EOS"
  5
  2
  2 5
  3
  1 3 5
  3
  2 4 5
  2
  3 5
  4
  1 2 3 4
EOS
OUTPUT2 = <<~"EOS"
  1 2
  2 3
  3 4
  4 5
EOS

INPUT3 = <<~"EOS"
  4
  2
  2 3
  1
  1
  2
  1 4
  1
  3
EOS
OUTPUT3 = <<~"EOS"
EOS

# 全域木の経路を返す
def spanning_tree_path(s, ad_list)
  n = ad_list.length
  paths = [[s]]
  while paths.length > 0
    path = paths.pop
    return path if path.length == n

    # 隣接頂点を調べる
    cn = path.last
    ad_list[cn].each do |nn|
      # 同じ頂点は使わない
      next if path.include?(nn)
      paths << path + [nn]
    end
  end
  []
end

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数
  n = input_lines.shift.to_i
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, idx|
    next if idx.odd?
    ad_list[idx / 2] = line.split.map(&:to_i)
  end

  # 全域木の経路を選択する
  path = []
  1.upto(n) do |s|
    path = spanning_tree_path(s, ad_list)
    break if path.length == n
  end

  # 全域木の構成を返す
  path.each_cons(2).map { |v| v.join(" ") }.join("\n")
end

puts main(STDIN.read)

=begin

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
1, ..., n の番号がついた n 個の頂点とそれらをつなぐ枝からなる無向グラフを考えます。ただし、自己ループと多重辺は考えません。

隣接リストが与えられます。このとき、この隣接リストから枝を n-1 個選んで全域木を構成し、出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
n
v_1
a_{1,1} a_{1,2} ... a_{1,v_1}
v_2
a_{2,1} ... a_{2,v_2}
...
v_n
a_{n,1} ... a_{n,v_n}

・ 1 行目に、頂点の個数を表す整数 n が与えられます。

・ 2i 行目には頂点 i に隣接している頂点の個数が与えられ、 2i+1 行目には頂点 i に隣接している頂点の番号が半角スペース区切りで与えられます。(1 ≦ i ≦ n)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
全域木を構成するために選んだ枝をそれぞれ 1 つずつ改行して出力してください。各行は枝の端点である 2 つの頂点の番号を半角スペースで区切って出力してください。
各行の頂点の順番は問いません。
また、出力する枝の順番も問いません。全域木であるため合計行数は n-1 行となります。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 3 ≦ n ≦ 20

・ 1 ≦ v_i ≦ n-1 (1 ≦ i ≦ n)

・ 1 ≦ i ≦ n について

 ・ v_i = 1 のとき : 1 ≦ a_{i,1} ≦ n

 ・ v_i > 1 のとき : 1 ≦ a_{i,j} < a_{i,j+1} ≦ n (1 ≦ j ≦ (v_i)-1)


すべての頂点が連結していることが保証されています。

入力例1
4
1
2
3
1 3 4
2
2 4
2
2 3

出力例1
1 2
2 3
3 4

入力例2
5
2
2 5
3
1 3 5
3
2 4 5
2
3 5
4
1 2 3 4

出力例2
1 2
2 3
3 4
4 5
=end
