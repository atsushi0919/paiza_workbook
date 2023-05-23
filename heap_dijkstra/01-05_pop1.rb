# ポップ1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__pop1

INPUT1 = <<"EOS"
1 7 3 5 12 9 11 10
EOS
OUTPUT1 = <<"EOS"
3 7 9 5 12 10 11
EOS

INPUT2 = <<"EOS"
1 3 3 5 12 9 8 4
EOS
OUTPUT2 = <<"EOS"
3 4 3 5 12 9 8
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
a = $stdin.read.split.map(&:to_i)

# インスタンス化
tree = BinaryTree.new a

# pop 後の tree のデータを出力
tree.pop
puts tree.data.join(" ")

=begin
根を 0 として、各ノードに順番に番号が割り当てられた二分木を考えます。
この二分木では、親ノードの番号を 2 倍して 1 または 2 を足したものが子ノードの番号となっています。

長さ 8 の数列が与えられます。この数列のインデックスと二分木の番号が対応しており、

数列の"親の番号"番目の要素は、"子の番号"番目の要素以下である
という条件(＊)が成り立っています。

今、与えられた長さ 8 の数列の先頭（0 番目）の数値が取り除かれ、数列の 0 番目には、数列の最後尾（7 番目）の値が割り当てられました。
条件(＊)が成り立つように要素を入れ替えた、長さ 7 の数列を出力してください。
ただし、要素の入れ替えは、二分木で親と子の関係にあるインデックス同士でのみおこなうことができるものとします。
また、二つの子の要素が同じでどちらも親の要素より小さいときは、番号の小さいほうの子の要素と入れ替えをおこなってください。

入力例 1 の場合を説明します。まず次のように数列と二分木が対応しています。
1/4

ノード 0 の値が取り除かれ、ノード 7 の値 10 がノード 0 に割り当てられました。ここから入れ替えをおこなっていきます。ノード 7 には値が割り当てられなくなったので、図から省いています。
2/4

ノード 0 の値 10 は子のノード 1 の値 7 と子のノード 2 の値 3 のどちらよりも大きいので入れ替えをおこないます。ノード 2 の値 3 のほうがノード 1 の値 7 より小さいので、ノード 2 の値 3 と入れ替えます。（仮にノード 1 の値 7 と入れ替えると、値 7 がノード 2 の値 3 より大きくなるため条件(＊)が成り立ちません。）
3/4

ノード 2 の値 10 は子のノード 5 の値 9 よりも大きいので入れ替えます。
4/4


最初に数列の先頭に割り当てた値 10 が二分木の末端まで来たので、入れ替えは終了です。答えとなる、操作が終了したあとの二分木に対応する数列は以下のようになります。
3 7 9 5 12 10 11


今回の問題のように、ヒープの先頭（根）の要素を取り除く操作を一般的にポップと呼びます。ヒープでは、先頭（根）の要素が最も小さいという特徴があるため、ポップにより簡単にその最小値を得ることができます。
▼　下記解答欄にコードを記入してみよう

入力される値
a_0 ... a_7

1 行目に長さ 8 の数列の要素が左から順番に半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
条件(＊)が成り立つように入れ替えた長さ 7 の数列の要素を、左から順番に半角スペース区切りで一行で出力してください。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


入力はすべて整数

0 ≦ a_i ≦ 10^5 (0 ≦ i ≦ 7)
入力例1
1 7 3 5 12 9 11 10

出力例1
3 7 9 5 12 10 11

入力例2
1 3 3 5 12 9 8 4

出力例2
3 4 3 5 12 9 8
=end
