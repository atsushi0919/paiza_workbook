# 単語のヒープ (paizaランク A 相当)
# https://paiza.jp/works/mondai/heap_dijkstra/heap_dijkstra__heap_words

INPUT1 = <<"EOS"
7 2
alpaca banana camera donuts eclair flower ginger
1 3 7 5 12 9 10
push hammer 2
pop
EOS
OUTPUT1 = <<"EOS"
alpaca
hammer banana camera donuts eclair flower ginger
EOS

INPUT2 = <<"EOS"
1 8
donuts
5
pop
push eclair 3
push banana 10
push ginger 8
push alpaca 9
pop
push flower 7
push camera 6
EOS
OUTPUT2 = <<"EOS"
donuts
eclair
camera flower banana alpaca ginger
EOS

class BinaryTree
  attr_reader :data

  def initialize(array = [], key = 0)
    @data = array
    @key = key
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
    while @data[parent_idx][@key] > @data[idx][@key]
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
        target_idx = @data[l_idx][@key] <= @data[r_idx][@key] ? l_idx : r_idx
      end
      if @data[idx][@key] > @data[target_idx][@key]
        swap(idx, target_idx)
        idx = target_idx
      else
        return
      end
    end
  end
end

# 入力
input_lines = $stdin.read.split("\n")
_ = input_lines.shift
w = input_lines.shift.split
a = input_lines.shift.split.map(&:to_i)
q = input_lines

# インスタンス化
tree = BinaryTree.new w.zip(a).map { |w_i, a_i| [a_i, w_i] }

# リクエスト処理
res = []
q.each do |req|
  op, word, num = req.split
  case op
  when "pop"
    res << tree.pop.last
  when "push"
    tree.push [num.to_i, word]
  end
end

# 出力
puts res, tree.data.map { |x| x.last }.join(" ")

=begin
根を 0 として、各ノードに順番に番号が割り当てられた二分木を考えます。
この二分木では、親ノードの番号を 2 倍して 1 または 2 を足したものが子ノードの番号となっています。

長さ N の単語列と数列が与えられます。この単語列と数列のインデックスと、二分木の番号が対応しており、

数列の"親の番号"番目の要素は、"子の番号"番目の要素以下である
という条件(＊)が成り立っています。

次の 2 種類のクエリが合計 Q 個与えられるので、与えられた順番に処理し、最後に処理が終了したあとの単語列を出力してください。
・push word num : 
num を数列の末尾に追加し、条件(＊)が成り立つように STEP 4 と同様の操作をして数列の要素を入れ替える。
word も同様に単語列の末尾に追加し、数列でおこなった入れ替えと同じ入れ替え操作を単語列でもおこなう。
・pop : 
単語列の先頭の要素を出力する。その後、数列の最後尾の要素を先頭の要素に置き換えて条件(＊)が成り立つように 
STEP 6 と同様の操作をして数列の要素を入れ替える。単語列も同様に末尾の要素を先頭の要素に置き換えて
数列でおこなった入れ替えと同じ入れ替え操作をおこなう。単語列と数列の長さが 1 の場合は、
単語列の先頭の要素を出力した後、単語列と数列の要素をすべて削除する。

ただし、要素の入れ替えは、二分木で親と子の関係にあるインデックス同士でのみおこなうことができるものとします。
また、数列の二つの子の要素が同じでどちらも親の要素より小さいときは、番号の小さいほうの子の要素と入れ替えをおこなってください。
▼　下記解答欄にコードを記入してみよう

入力される値
N Q
w_0 ... w_{N-1}
a_0 ... a_{N-1}
q_1
...
q_Q

1 行目に、整数 N, Q が与えられます。

2 行目に長さ N の単語列の要素が左から順番に半角スペース区切りで与えられます。

3 行目に長さ N の数列の要素が左から順番に半角スペース区切りで与えられます。

3 + j 行目に各クエリ q_j が与えられます。(1 ≦ j ≦ Q)


q_j は以下のいずれかの形式です。(1 ≦ j ≦ Q)
push word_j num_j

pop

j 番目のクエリでは、まずクエリの種類（push, popのいずれか）が与えられ、push の場合はさらに文字列 word_j と 整数 num_j が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
種類が pop であるクエリの数を q_pop として、合計 q_pop + 1 行出力してください。 j 行目では、種類が pop となる j 番目のクエリに従って出力してください。(1 ≦ j ≦ q_pop)　q_pop + 1 行目には、すべてのクエリが終了したあとの単語列の要素を左から順番に半角スペース区切りで出力してください。

また末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


1 ≦ N ≦ 10^4

1 ≦ Q ≦ 10^4

w_i は半角英小文字からなる 6 文字の文字列 (0 ≦ i ≦ N-1)

0 ≦ a_i ≦ 10^5 (0 ≦ i ≦ N-1)

word_j は半角英小文字からなる 6 文字の文字列 (1 ≦ j ≦ Q, ただし、q_j の種類は push)

0 ≦ num_j ≦ 10^5 (1 ≦ j ≦ Q, ただし、q_j の種類は push)


数列の長さが 0 のとき、種類が pop であるクエリは次に与えられないことが保証されています。
入力例1
7 2
alpaca banana camera donuts eclair flower ginger
1 3 7 5 12 9 10
push hammer 2
pop

出力例1
alpaca
hammer banana camera donuts eclair flower ginger

入力例2
1 8
donuts
5
pop
push eclair 3
push banana 10
push ginger 8
push alpaca 9
pop
push flower 7
push camera 6

出力例2
donuts
eclair
camera flower banana alpaca ginger
=end
