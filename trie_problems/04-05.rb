# 単語予測 (paizaランク A 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__word_prediction

INPUT1=<<"EOS"
5
aiueo
aiue
abcdef
aaaaaa
dummy
a
EOS
OUTPUT1=<<"EOS"
aaaaaa
abcdef
aiue
aiueo
EOS
INPUT2=<<"EOS"
5
problem
hogehoge
test
aiueo
abcdefghi
xyz
EOS
OUTPUT2=<<"EOS"
xyz
EOS

class Trie
  attr_accessor :root
  class Node
    attr_accessor :child,:is_end
    def initialize
      @child={}
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
  def display(t)
    r=[];s=[[@root,"",false]]
    while s.size>0
      n,w,f=s.pop
      f=true if w==t
      r<<w if f&&n.is_end
      n.child.keys.each{|c|
        s<<[n.child[c],w+c,f] if n.child[c]
      }
    end
    r==$*?t:r.sort
  end
end

trie=Trie.new;_,*s,t=`dd`.split;s.each{|w|trie.insert w}
puts trie.display t

=begin
N 個の文字列 S_1, ..., S_N が与えられます。その後, 文字列 W が与えられます。
S_1, ..., S_N に含まれる単語でプレフィックスに W を含むものを辞書順で全て出力してください。
そのような単語が存在しない場合は W だけを出力してください。
辞書順とは、辞書に出てくる順番のことで、たとえば abc, aaa, acb, abd の4つを辞書順に並び替えると aaa, abc, abd, acb の順になります。

▼　下記解答欄にコードを記入してみよう

入力される値
N
S_1
...
S_N
W


・ 1 行目に文字列の数 N、続く N 行に文字列 S_i が与えられます。
・ 続けて文字列 W が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i 行目には辞書順でi番目の文字を出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします

・1 ≦ N ≦ 10^4
・S_i, W はアルファベット小文字で構成された文字列
・1 ≦ |S_i|, W ≦ 100 (|S_i|は、Sの文字数です。)
・S_i ≠ S_j (i≠j)

入力例1
5
aiueo
aiue
abcdef
aaaaaa
dummy
a

出力例1
aaaaaa
abcdef
aiue
aiueo

入力例2
5
problem
hogehoge
test
aiueo
abcdefghi
xyz

出力例2
xyz
=end