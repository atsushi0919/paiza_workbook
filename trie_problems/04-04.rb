# 辞書順ソート (paizaランク A 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__lexical_order

INPUT1=<<"EOS"
5
zzzzz
ab
aab
aa
a
EOS
OUTPUT1=<<"EOS"
a
aa
aab
ab
zzzzz
EOS
INPUT2=<<"EOS"
4
d
c
b
a
EOS
OUTPUT2=<<"EOS"
a
b
c
d
EOS

class Trie
  attr_accessor :root
  class Node
    attr_accessor :child,:is_end
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
    w.each_char{|c|
      n.child[c]=Node.new if !n.child[c];n=n.child[c]
    }
    n.is_end=true
  end
  def display
    r=[];s=[[@root,""]]
    while s.size>0
      n,w=s.pop;r<<w if n.is_end
      n.child.keys.each{|c|s<<[n.child[c],w+c] if n.child[c]}
    end
    r.sort
  end
end

trie=Trie.new;_,*s=`dd`.split;s.each{|w|trie.insert w}
puts trie.display

=begin
N 個の文字列 S_1, ..., S_N が与えられます。これらの文字列をトライ木に格納した後、トライ木に格納された文字列を辞書順に出力してください。
辞書順とは、辞書に出てくる順番のことで、たとえば abc, aaa, acb, abd の 4 つを辞書順に並び替えると aaa, abc, abd, acb の順になります。

▼　下記解答欄にコードを記入してみよう

入力される値
N
S_1
...
S_N


・ 1 行目に文字列の数 N が与えられます。
・ 続く N 行に文字列 S_1, ..., S_N が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i 行目には辞書順で i 番目の文字列を出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします

・1 ≦ N ≦ 10^4.
・Sはアルファベット小文字で構成された文字列
・1 ≦ |S_i| ≦ 100 (|S_i|は、S の文字数です。)
・S_i≠S_j (i≠j)

入力例1
5
zzzzz
ab
aab
aa
a

出力例1
a
aa
aab
ab
zzzzz

入力例2
4
d
c
b
a

出力例2
a
b
c
d
=end