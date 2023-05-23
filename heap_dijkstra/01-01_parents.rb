# 二分木の親 (paizaランク C 相当)
# https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__parents

INPUT1 = <<"EOS"
5
EOS
OUTPUT1 = <<"EOS"
2
EOS

INPUT2 = <<"EOS"
4
EOS
OUTPUT2 = <<"EOS"
1
EOS

class BinaryTree
  def initialize(array = [])
    @data = []
    array.each { |element| push(element) }
  end

  def push(element)
    @data << element
  end

  def parent_idx(idx)
    idx / 2 + idx % 2 - 1
  end
end

# 入力
n = gets.to_i

# インスタンス化
tree = BinaryTree.new 0..n

# n の親の番号を出力
puts tree.parent_idx(n)

=begin
この問題集では、プライオリティーキューを利用したダイクストラ法を扱います。
プライオリティキュー（優先度付きキュー）とは、優先度の高いデータから取り出すというデータ構造で、その代表的なものがヒープといわれる木構造です。
ヒープの中にも種類がありますが、今回は二分ヒープを扱います。ダイクストラ法とは、最短経路問題を解くアルゴリズムの一つです。
問題集の前半で二分ヒープの実装を、後半で二分ヒープを利用したダイクストラ法の実装と利用をおこない、それぞれの理解を深めます。

まずは、二分ヒープの基本となる二分木に慣れる問題です。
二分木とは、根付き木構造と呼ばれるデータ構造で、親は高々二つの子をもつという関係が成り立っています。次の画像を参考にしてください。


根を 0 として、各ノードに順番に番号が割り当てられた二分木を考えます。この二分木では、親ノードの番号を 2 倍して 1 または 2 を足したものが子ノードの番号となっています。

整数 N が与えられます。番号 N のノードの親ノードの番号を出力してください。

入力例 1 の場合、図から分かるように、ノード 5 の親はノード 2 となります。


▼　下記解答欄にコードを記入してみよう

入力される値
N

1 行目に、整数 N が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
番号 N のノードの親ノードの番号を一行で出力してください。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


入力はすべて整数

1 ≦ N ≦ 10^5
入力例1
5

出力例1
2

入力例2
4

出力例2
1
=end
