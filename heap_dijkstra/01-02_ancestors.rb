# 二分木の先祖 (paizaランク C 相当)
# https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__ancestors

INPUT1 = <<"EOS"
5
EOS
OUTPUT1 = <<"EOS"
2 0
EOS

INPUT2 = <<"EOS"
4
EOS
OUTPUT2 = <<"EOS"
1 0
EOS

class BinaryTree
  def initialize(array = [])
    @data = array
  end

  def push(element)
    @data << element
  end

  def parent_idx(idx)
    idx / 2 + idx % 2 - 1
  end

  def size
    @data.length
  end

  def up_heap
    idx = size - 1
    res = []
    res << idx = parent_idx(idx) while idx != 0
    res
  end
end

# 入力
n = gets.to_i

# インスタンス化
tree = BinaryTree.new (0..n).to_a

# n から根までの番号を出力
puts tree.up_heap.join(" ")

=begin
根を 0 として、各ノードに順番に番号が割り当てられた二分木を考えます。
この二分木では、親ノードの番号を 2 倍して 1 または 2 を足したものが子ノードの番号となっています。

整数 N が与えられます。番号 N のノードから番号 0 の根まで親ノードを辿っていき、その辿った親ノードの番号を順番に半角スペース区切りで出力してください。

入力例 1 の場合、図から分かるように、ノード 5 の親はノード 2 で、ノード 2 の親は ノード 0 であり、ノード 0 は根であるので、出力は

2 0
となります。

▼　下記解答欄にコードを記入してみよう

入力される値
N

1 行目に、整数 N が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
番号 N のノードから根まで辿ったときの親ノードの番号を順番に半角スペース区切りで一行で出力してください。出力の右端は必ず 0 となります。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


入力はすべて整数

1 ≦ N ≦ 10^5
入力例1
5

出力例1
2 0

入力例2
4

出力例2
1 0
=end
