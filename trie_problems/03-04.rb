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
class Trie
  CHARSIZE = 26  # アルファベット小文字の種類数

  class Node # 頂点を表すクラス
    attr_accessor :child, :is_end

    def initialize
      @child = [nil] * Trie::CHARSIZE  # 最大でCHARSIZE分の辺がこの頂点から出ていく
      @is_end = false  # この頂点が単語の終点であることを記録する
    end
  end

  def initialize
    @root = Node.new  # 最初はトライ木は根だけを持つ
  end

  # 文字列wordをトライに挿入するメソッド
  def insert(word)
    ptr = @root  # ptrは最初に根を指す
    word.each_char do |ch|
      if ptr.child[ch.ord - "a".ord].nil? # 有向辺がない場合
        ptr.child[ch.ord - "a".ord] = Node.new  # 頂点を作成する
      end

      ptr = ptr.child[ch.ord - "a".ord]  # 次のノードに移動
    end
    ptr.is_end = true  # この頂点に対応する文字が格納されている
  end

  # 文字列wordがトライに格納されているかを確認するメソッド
  def is_key(word)
    ptr = @root  # ptrは最初に根を指す
    word.each_char do |ch|
      if ptr.child[ch.ord - "a".ord].nil? # 有向辺がない場合、トライ木にwordは格納されていない
        return false
      end

      ptr = ptr.child[ch.ord - "a".ord]  # 次のノードに移動
    end
    ptr.is_end  # wordに対応する頂点のis_trueを返す
  end

  # 文字列keyがトライに格納されているなら削除するメソッド
  def erase(key)
    ptr = @root  # ptrは最初に根を指す
    stack = [ptr]  # 進んだ順番を記録しておくスタック

    key.each_char do |ch|
      if ptr.child[ch.ord - "a".ord].nil?
        # 文字列keyはトライ木に格納されていない場合
        return
      end
      ptr = ptr.child[ch.ord - "a".ord]  # 次の頂点に進む
      stack.push(ptr)  # 進んだ頂点をスタックに記録
    end

    ptr.is_end = false  # この頂点に対応する文字列は記録されていない

    # 来た経路を逆に戻る.葉となっている頂点は削除してよい
    stack.pop
    while ptr != @root && !ptr.is_end # ptrが根を指す場合はダメ, 削除したい頂点のis_endがTrueならダメ
      Trie::CHARSIZE.times do |i|
        if !ptr.child[i].nil? # この頂点から辺が出ている
          return  # 今いる頂点は葉ではないのでこれ以上消せる頂点はない
        end
      end

      # 葉である場合
      ptr = nil  # この頂点(オブジェクト)を削除する
      ptr = stack.last  # 親である頂点に移動
      stack.pop  # スタックから削除
      ptr.child[key[stack.length].ord - "a".ord] = nil  # 辺を削除
    end
  end
end

trie = Trie.new
n, m, q = gets.split.map(&:to_i)
n.times { trie.insert(gets.chomp) }

m.times { trie.erase(gets.chomp) }

ans = Array.new(q, "")
q.times { |i| ans[i] = trie.is_key(gets.chomp) ? "Yes" : "No" }

puts ans



class Trie:
    CHARSIZE = 26  # アルファベット小文字の種類数

    class Node:  # 頂点を表すクラス
        def __init__(self) -> None:  # コンストラクタによる初期化
            self.child: list = [None] * Trie.CHARSIZE  # 最大でCHARSIZE分の辺がこの頂点から出ていく
            self.is_end: bool = False  # この頂点が単語の終点であることを記録する

    def __init__(self) -> None:
        self.root: Trie.Node = Trie.Node()  # 最初はトライ木は根だけを持つ

    # 文字列wordをトライに挿入するメソッド
    def insert(self, word: str) -> None:
        ptr: Trie.Node = self.root  # ptrは最初に根を指す
        for ch in word:
            if ptr.child[ord(ch) - ord("a")] is None:  # 有向辺がない場合
                ptr.child[ord(ch) - ord("a")] = Trie.Node()  # 頂点を作成する

            ptr = ptr.child[ord(ch) - ord("a")]  # 次のノードに移動
        ptr.is_end = True  # この頂点に対応する文字が格納されている
        return

    # 文字列wordがトライに格納されているかを確認するメソッド
    def is_key(self, word: str) -> bool:
        ptr: Trie.Node = self.root  # ptrは最初に根を指す
        for ch in word:
            if ptr.child[ord(ch) - ord("a")] is None:  # 有向辺がない場合、トライ木にwordは格納されていない
                return False

            ptr = ptr.child[ord(ch) - ord("a")]  # 次のノードに移動
        return ptr.is_end  # wordに対応する頂点のis_trueを返す

    # 文字列keyがトライに格納されているなら削除するメソッド
    def erase(self, key: str) -> None:
        ptr: Trie.Node = self.root  # ptrは最初に根を指す
        stack: list = [ptr]  # 進んだ順番を記録しておくスタック

        for ch in key:
            if ptr.child[ord(ch) - ord("a")] is None:
                # 文字列keyはトライ木に格納されていない場合
                return
            ptr = ptr.child[ord(ch) - ord("a")]  # 次の頂点に進む
            stack.append(ptr)  # 進んだ頂点をスタックに記録

        ptr.is_end = False  # この頂点に対応する文字列は記録されていない

        # 来た経路を逆に戻る.葉となっている頂点は削除してよい
        stack.pop()
        while (
            ptr is not self.root and ptr.is_end == False
        ):  # ptrが根を指す場合はダメ, 削除したい頂点のis_endがTrueならダメ
            for i in range(Trie.CHARSIZE):
                if ptr.child[i] is not None:  # この頂点から辺が出ている
                    return  # 今いる頂点は葉ではないのでこれ以上消せる頂点はない

            # 葉である場合
            del ptr  # この頂点(オブジェクト)を削除する
            ptr = stack[-1]  # 親である頂点に移動
            stack.pop()  # スタックから削除
            ptr.child[ord(key[len(stack)]) - ord("a")] = None  # 辺を削除
        return


trie = Trie()
N, M, Q = map(int, input().split())
for i in range(N):
    S: str = input()
    trie.insert(S)

for i in range(M):
    T: str = input()
    trie.erase(T)

ans = [""] * Q
for i in range(Q):
    W: str = input()
    ans[i] = "Yes" if trie.is_key(W) else "No"  # 三項演算子

for i in ans:
    print(i)


解説（解法のポイント）
方針
トライ木に格納されている他の文字列に影響がないように頂点や辺の削除を行わなくてはなりません。そのため、いくつかの場合分けが必要になります。
最初にトライ木に文字列 T に対応する頂点とそこに至る系路が存在し、かつその頂点が最後の文字であるか (メンバ変数 is_end が true か) を確認しなければなりません。
この部分は以前の問題「キーの確認」と同じです。 キーがトライ木に存在するかの判定は１つ前の問題「キーの確認」の解説を参考にしてください。
T に対応する頂点が存在し、かつ葉 (子を持たない頂点) となっている場合以外は、頂点の削除を行いません。

上の条件を満たすならば、次は T に対応する頂点が葉であるかを確認しなければなりません。
出ていく辺がある場合(つまり葉ではない場合)、 is_end を false にするだけで良いです。
例えば aa と aaaa が格納されたトライ木で aa を削除する際は　aa の is_end を false にするだけで良く、頂点の辺や削除は行いません。

T がトライ木に格納された文字列で、葉である場合はいくつかの頂点と辺を削除することができます。
具体的には、トライ木に格納されている文字列のうち、T に対応する頂点に到達するためだけに必要な頂点と辺を削除しても良いです。
例えば、 aa と aaaa が格納されたトライ木で aaaa を削除する場合、削除して良い頂点は aaa と aaaa の 2 つです。
削除して良い辺はこれらの頂点に入る辺、出ていく辺です。 aaa と bbb が格納されたトライ木で bbb を削除する場合、 削除して良い頂点は b, bb, bbb の 3 つです。
削除して良い辺はこれらの頂点に入る辺、出ていく辺です。根は長さ 0 のプレフィックスに到達するために必要なので消すことができません。
aaaa だけが格納されたトライ木で消さなければならないのは根から aaaa に至る経路に存在する、根以外の全ての頂点と全ての辺です。

削除を行う際の実装として根から文字列 word に対応する頂点までに通る頂点をスタックに記録します。
各頂点は親 (1つ前にいた頂点) に戻るための情報を持っていないため、親に戻る場合はスタックの情報を用います。
頂点を削除する場合は親から出ている辺も削除する必要があります。

問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
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