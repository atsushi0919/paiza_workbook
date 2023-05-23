# プッシュ2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__push2

INPUT1 = <<"EOS"
6
1 3 7 5 12 9
0
EOS
OUTPUT1 = <<"EOS"
0 3 1 5 12 9 7
EOS

INPUT2 = <<"EOS"
12
1 3 7 5 12 9 11 6 6 12 14 11
6
EOS
OUTPUT2 = <<"EOS"
1 3 6 5 12 7 11 6 6 12 14 11 9
EOS

class BinaryTree
  attr_reader :data

  def initialize(array = [])
    @data = array
  end

  def push(element)
    @data << element
    up_heap
  end

  def parent_idx(idx)
    idx / 2 + idx % 2 - 1
  end

  def size
    @data.length
  end

  def swap(a, b)
    @data[a], @data[b] = @data[b], @data[a]
  end

  def up_heap
    idx = size - 1
    return if idx == 0
    parent_idx = parent_idx(idx)
    while @data[parent_idx] > @data[idx]
      swap(parent_idx, idx)
      return if parent_idx == 0
      idx = parent_idx
      parent_idx = parent_idx(idx)
    end
  end
end

# 入力
n, *a, x = $stdin.read.split.map(&:to_i)

# インスタンス化
tree = BinaryTree.new a
# x を挿入
tree.push(x)

# BinaryTree のデータを出力
puts tree.data.join(" ")

=begin
根を 0 として、各ノードに順番に番号が割り当てられた二分木を考えます。
この二分木では、親ノードの番号を 2 倍して 1 または 2 を足したものが子ノードの番号となっています。

長さ N の数列が与えられます。この数列のインデックスと二分木の番号が対応しており、

数列の"親の番号"番目の要素は、"子の番号"番目の要素以下である
という条件(＊)が成り立っています。

整数 x が与えられます。はじめに与えられ長さ N の数列の末尾に x を追加したのち、条件(＊)が成り立つように要素を入れ替えた、
長さ N+1 の数列を出力してください。ただし、要素の入れ替えは、二分木で親と子の関係にあるインデックス同士でのみおこなうことができるものとします。
▼　下記解答欄にコードを記入してみよう

入力される値
N
a_0 ... a_{N-1}
x

1 行目に数列の長さを表す整数 N が与えられます。

2 行目に長さ N の数列の要素が左から順番に半角スペース区切りで与えられます。

3 行目に整数 x が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
条件(＊)が成り立つように入れ替えた長さ N+1 の数列の要素を、左から順番に半角スペース区切りで一行で出力してください。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


入力はすべて整数

1 ≦ N ≦ 10^5

0 ≦ a_i ≦ 10^5 (0 ≦ i ≦ N-1)

0 ≦ x ≦ 10^5

入力例1
6
1 3 7 5 12 9
0

出力例1
0 3 1 5 12 9 7

入力例2
12
1 3 7 5 12 9 11 6 6 12 14 11
6

出力例2
1 3 6 5 12 7 11 6 6 12 14 11 9
=end
