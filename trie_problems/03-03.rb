# キーの確認 (paizaランク B 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__struct_key_check

INPUT1=<<"EOS"
4 5
test
tree
check
a
test
aaaaa
tester
a
b
EOS
OUTPUT1=<<"EOS"
Yes
No
No
Yes
No
EOS

INPUT2=<<"EOS"
3 2
abcde
fghijk
lmnxyz
abcde
xxxxxxxxxxx
EOS
OUTPUT2=<<"EOS"
Yes
No
EOS

class Trie
  attr_accessor :root
  class Node
    attr_accessor :child, :is_end
    def initialize
      @child={}
      @is_end=false
    end
  end
  def initialize
    @root=Node.new
  end
  def insert(w)
    n=@root
    w.each_char{|c|n.child[c]=Node.new if !n.child[c];n=n.child[c]}
    n.is_end=true
  end
  def search(w)
    n=@root;f=true
    w.each_char{|c|if !n.child[c];f=!f;break;end;n=n.child[c]}
    f&n.is_end ? true: false
  end
end

trie=Trie.new;n,q,*t=`dd`.split
t.shift(n.to_i).map{|w|trie.insert w}
puts t.shift(q.to_i).map{|w|trie.search(w)?:Yes: :No}

=begin
class Trie
  attr_accessor :root
  class Node
    attr_accessor :child, :is_end
    def initialize
      @child={}
      @is_end=false
    end
  end
  def initialize
    @root=Node.new
  end
  def insert(s)
    n=@root
    s.each_char{|c|n.child[c]=Node.new if !n.child[c];n=n.child[c]}
    n.is_end=true
  end
end

trie=Trie.new;n,q,*t=`dd`.split.map{|x|x=~/\d+/?x.to_i: x}
n.times.map{trie.insert x=t.shift;x}
puts q.times.map{
  f=true;n=trie.root;t.shift.each_char{|c|if !n.child[c];f=!f;break;end;n=n.child[c]}
  f&&n.is_end ? :Yes: :No
}

この問題では与えられた文字列 word がトライ木に格納された文字列であるかを確認し, 
格納された文字列であるなら true 、そうでないなら false を返すメソッド search(word: string): bool を作成してください。
詳しい手順は述べませんが、word の対応する頂点が存在し、かつその頂点のメンバ変数 is_end が true であるなら word はトライ木に格納された文字列です。

N 個の文字列 S_1, ..., S_N が与えられます。
各 S_i をトライ木に格納した後, 以下の Q 個のクエリに答えてください。
・アルファベット小文字の文字列 T が与えられます。T がトライ木に格納された文字列なら Yes 、存在しないなら No を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N Q
S_1
...
S_N
query_1
...
query_Q


・ 1 行目に N, Q が与えられます。続いて文字列 S_1, ..., S_N が与えられ、その後に続く Q 行のクエリが与えられます。各クエリは
T
の形式で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i 行目では i 番目のクエリに対する出力を行ってください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします。
・ 1 ≦ N ≦ 100
・ 1 ≦ Q ≦ 10^4
・ S_i, T はアルファベット小文字の文字列
・ 1 ≦ |S_i|, |T| ≦ 10^3 (|S_i|はS_iの長さです)

入力例1
4 5
test
tree
check
a
test
aaaaa
tester
a
b

出力例1
Yes
No
No
Yes
No

入力例2
3 2
abcde
fghijk
lmnxyz
abcde
xxxxxxxxxxx

出力例2
Yes
No
=end