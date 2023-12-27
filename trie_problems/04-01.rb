# プレフィックスの個数カウント (paizaランク B 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__prefix_count

INPUT1=<<"EOS"
4 5
long
longlong
longest
leading
lo
long
longest
longlonglong
along
EOS
OUTPUT1=<<"EOS"
3
3
1
0
0
EOS
INPUT2=<<"EOS"
3 2
aaaa
aaaa
aaaa
a
aaaa
EOS
OUTPUT2=<<"EOS"
3
3
EOS

class Trie
  attr_accessor :root
  class Node
    attr_accessor :child, :word
    def initialize
      @child={}
      @word=0
    end
  end
  def initialize
    @root=Node.new
  end
  def insert(w)
    n=@root;n.word+=1
    w.each_char{|c|
      n.child[c]=Node.new if !n.child[c];n=n.child[c];n.word+=1
    }
  end
  def count_prefix(w)
    n=@root
    w.each_char{|c|return 0 if !n.child[c];n=n.child[c]}
    n.word
  end
end

trie=Trie.new;t=`dd`.split $/;n,q=t.shift.split.map &:to_i
t.shift(n).each{|w|trie.insert w}
puts t.shift(q).map{|w|trie.count_prefix w}

=begin
この問題ではトライ木に記録された文字列のうち、
与えられた文字列 T をプレフィックスとして持つ文字列の数を返すメンバ関数 count_prefix(word: string): int を作成してください。

N 個の文字列 S_1, ..., S_N が与えられます。
次に以下の Q 個のクエリに答えてください。
・文字列 T が与えられます。T をプレフィックスの１つとして持つ単語は S_1, ..., S_N の中に何個あるかを出力してください。

ある文字列のプレフィックスとは、その文字列の先頭から始まる連続部分文字列のことを指します。
例えば、文字列 "apple" のプレフィックスは"", "a", "ap", "app", "appl", "apple"の 6 つです。

▼　下記解答欄にコードを記入してみよう

入力される値
N Q
S_1
...
S_N
query_1
...
query_Q


・ 1 行目に文字列の数 N 、 続く N 行に文字列 S_1, ..., S_N が与えられます。
・続けて Q 行にクエリが与えられます。各クエリは
T

の形式で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i 行目には i 番目のクエリに対する出力を行ってください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします

・1 ≦ N, Q ≦ 10^3
・S_i, T はアルファベット小文字で構成された文字列
・1 ≦ |S_i|, |T| ≦ 10^3 (|S_i|は、Sの文字数です。)

入力例1
4 5
long
longlong
longest
leading
lo
long
longest
longlonglong
along

出力例1
3
3
1
0
0

入力例2
3 2
aaaa
aaaa
aaaa
a
aaaa

出力例2
3
3
=end