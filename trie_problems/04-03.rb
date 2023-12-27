# 最長共通プレフィックスの検索 (paizaランク A 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__search_LCP

INPUT1=<<"EOS"
4
lo
longer
longlong
along
longest
EOS
OUTPUT1=<<"EOS"
longe
EOS
INPUT2=<<"EOS"
4
aiueo
abcde
prefix
suffix
pre
EOS
OUTPUT2=<<"EOS"
pre
EOS
INPUT3=<<"EOS"
3
xxxxxx
yyyyyy
zzzzzz
hogehoge
EOS
OUTPUT3=<<"EOS"
#
EOS

class Trie
  attr_accessor :root
  class Node
    attr_accessor :child
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
  end
  def get_lcp(w)
    n=@root
    (0...w.size).each{|i|
      return w[...i]==""? ?#:w[...i] if !n.child[w[i]]
      n=n.child[w[i]]
    }
    w
  end
end

trie=Trie.new;_,*s,t=`dd`.split;s.each{|w|trie.insert w}
puts trie.get_lcp t

=begin
この問題ではトライ木に格納された文字列と文字列 T との共通プレフィックスのうち最長のものを返すメソッド get_lcp(T: string): string を作成してください。

N 個の文字列 S_1, ..., S_N が与えられます。その後文字列 T が与えられます。
S_1, ..., S_N に含まれる全ての文字列と T との共通プレフィックスのうち最長の文字列(最長共通プレフィックス) を出力してください。
ただし長さ 1 以上のプレフィックスが存在しない場合は # と出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N
S_1
...
S_N
T

・ 1 行目に文字列の数N, 続く N 行に文字列 S_1, ..., S_N が与えられます。
・ その後, 文字列 T が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
最長共通プレフィックスを1行で出力してください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします

・1 ≦ N ≦ 10^3
・ S_i, T はアルファベット小文字のみで構成された文字列
・1 ≦ |S_i|, |T| ≦ 2×10^3 (|S_i| は、S の文字数です。)

入力例1
4
lo
longer
longlong
along
longest

出力例1
longe

入力例2
4
aiueo
abcde
prefix
suffix
pre

出力例2
pre

入力例3
3
xxxxxx
yyyyyy
zzzzzz
hogehoge

出力例3
#
=end