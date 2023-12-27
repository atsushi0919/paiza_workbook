# キーの削除 (paizaランク A 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__struct_erase

INPUT1=<<"EOS"
3 2 3
aaaaa
aaa
a
aaa
xxx
aaaaa
aaa
a
EOS
OUTPUT1=<<"EOS"
Yes
No
Yes
EOS

INPUT2=<<"EOS"
2 1 1
aaaa
aaaa
aaaa
aaaa
EOS
OUTPUT2=<<"EOS"
No
EOS

INPUT3=<<"EOS"
3 2 3
abc
ab
a
abc
a
abc
ab
a
EOS
OUTPUT3=<<"EOS"
No
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
  def erase(w)
    s=[n=@root]
    w.each_char{|c|return if n.child[c].nil?;n=n.child[c];s<<n}
    n.is_end=false;s.pop
    while n!=@root&&!n.is_end
      return if !n.child.keys.empty?
      n=s[-1];s.pop;n.child.delete w
    end
  end
end

trie=Trie.new;t=`dd`.split $/;n,m,q=t.shift.split.map &:to_i
t.shift(n).each{|w|trie.insert w};t.shift(m).each{|w|trie.erase w}
puts t.shift(q).map{|w|trie.search(w)?:Yes: :No}


=begin
この問題では与えられた文字列 T をトライ木から削除するメンバ関数 erase(word: string): void を作成してください。
この関数は同じ文字列がトライ木に複数回挿入されていても一度の操作で全てを削除します。
word がトライ木に格納されていない場合にはどのような操作も行いません。

N 個の文字列 S_1, ..., S_N が与えられます。これらの文字列をトライ木に格納してください。
次に M 個の文字列 T_1, ..., T_M が与えられます。T_i がトライ木に格納されている文字列ならトライ木から削除してください。
最後に Q 個のクエリが与えられます。各クエリでは文字列 W が与えられるので W がトライ木に存在する文字列ならば Yes 、存在しないならば No を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N M Q
S_1
...
S_N
T_1
...
T_M
query_1
...
query_Q


・ 1行目に N, M, Q が与えられます。
・続く N 行に文字列 S_1, ..., S_N が与えられます。
・続く M 行に文字列 T_1, ..., T_M が与えられます。
・続く Q 行にクエリが与えられます。各クエリは
W

の形式で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i 番目のクエリに対する出力を i 行目に出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします。

・ 1 ≦ N ≦ 100
・ 1 ≦ M, Q ≦ 10^3
・ S_i, T_i, W はアルファベット小文字で構成された文字列
・ 1 ≦ |S_i|, |T_i|, |W| ≦ 10^3 (|S_i| は、S の文字数です)

入力例1
3 2 3
aaaaa
aaa
a
aaa
xxx
aaaaa
aaa
a

出力例1
Yes
No
Yes

入力例2
2 1 1
aaaa
aaaa
aaaa
aaaa

出力例2
No

入力例3
3 2 3
abc
ab
a
abc
a
abc
ab
a

出力例3
No
Yes
No
=end