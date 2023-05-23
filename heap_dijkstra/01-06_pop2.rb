# ポップ2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__pop2

INPUT1 = <<"EOS"
8
1 7 3 5 12 9 11 10
EOS
OUTPUT1 = <<"EOS"
3 7 9 5 12 10 11
EOS

INPUT2 = <<"EOS"
9
1 3 9 4 5 10 11 12 8
EOS
OUTPUT2 = <<"EOS"
3 4 9 8 5 10 11 12
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

  def pop
    target_element = @data.shift
    if size > 1
      @data.unshift @data.pop
      down_heap
    end
    target_element
  end

  def size
    @data.length
  end

  def parent_idx(idx)
    idx / 2 + idx % 2 - 1
  end

  def swap(a, b)
    @data[a], @data[b] = @data[b], @data[a]
  end

  def left_child_idx(idx)
    (idx * 2) + 1
  end

  def right_child_idx(idx)
    (idx * 2) + 2
  end

  def has_child?(idx)
    ((idx * 2) + 1) < @data.size
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

  def down_heap
    idx = 0
    while (has_child?(idx))
      l_idx = left_child_idx(idx)
      r_idx = right_child_idx(idx)
      if @data[r_idx].nil?
        target_idx = l_idx
      else
        target_idx = @data[l_idx] <= @data[r_idx] ? l_idx : r_idx
      end
      if @data[idx] > @data[target_idx]
        swap(idx, target_idx)
        idx = target_idx
      else
        return
      end
    end
  end
end

# 入力
n, *a = $stdin.read.split.map(&:to_i)

# インスタンス化
tree = BinaryTree.new a

# pop 後の tree のデータを出力
tree.pop
puts tree.data.join(" ")

=begin
根を 0 として、各ノードに順番に番号が割り当てられた二分木を考えます。
この二分木では、親ノードの番号を 2 倍して 1 または 2 を足したものが子ノードの番号となっています。

長さ N の数列が与えられます。この数列のインデックスと二分木の番号が対応しており、

数列の"親の番号"番目の要素は、"子の番号"番目の要素以下である
という条件(＊)が成り立っています。

今、与えられた長さ N の数列の先頭（0 番目）の数値が取り除かれ、数列の 0 番目には、数列の最後尾（N-1 番目）の値が割り当てられました。
条件(＊)が成り立つように要素を入れ替えた、長さ N-1 の数列を出力してください。
ただし、要素の入れ替えは、二分木で親と子の関係にあるインデックス同士でのみおこなうことができるものとします。
また、二つの子の要素が同じでどちらも親の要素より小さいときは、番号の小さいほうの子の要素と入れ替えをおこなってください。
▼　下記解答欄にコードを記入してみよう

入力される値
N
a_0 ... a_{N-1}

1 行目に数列の長さを表す整数 N が与えられます。

2 行目に長さ N の数列の要素が左から順番に半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
条件(＊)が成り立つように入れ替えた長さ N-1 の数列の要素を、左から順番に半角スペース区切りで一行で出力してください。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


入力はすべて整数

2 ≦ N ≦ 10^5

0 ≦ a_i ≦ 10^5 (0 ≦ i ≦ N-1)
入力例1
8
1 7 3 5 12 9 11 10

出力例1
3 7 9 5 12 10 11

入力例2
9
1 3 9 4 5 10 11 12 8

出力例2
3 4 9 8 5 10 11 12
=end
