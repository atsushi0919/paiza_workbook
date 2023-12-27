# 単語の意味の登録 (paizaランク B 相当)
# https://paiza.jp/works/mondai/trie_problems/trie_problems__meaning_of_the_word

INPUT1=<<"EOS"
4 5
t 20th_alphabet
test exam
testing do_test
tester person_doing_the_test
t
test
testing
tester
subject
EOS
OUTPUT1=<<"EOS"
20th_alphabet
exam
do_test
person_doing_the_test
NOTFOUND
EOS
INPUT2=<<"EOS"
4 5
one 1
two 2
minus -
today YYYY/MM/DD
one
two
minus
today
tomorrow
EOS
OUTPUT2=<<"EOS"
1
2
-
YYYY/MM/DD
NOTFOUND
EOS

class Trie
  attr_accessor :root
  class Node
    attr_accessor :child,:value
    def initialize
      @child={}
      @value=p
    end
  end
  def initialize
    @root=Node.new
  end
  def insert(w,v)
    n=@root
    w.each_char{|c|n.child[c]=Node.new if !n.child[c];n=n.child[c]}
    n.value=v
  end
  def get_value(w)
    r=:NOTFOUND;n=@root
    w.each_char{|c|return r if !n.child[c];n=n.child[c]}
    n.value||r
  end
end

trie=Trie.new;t=`dd`.split $/;n,q=t.shift.split.map &:to_i
t.shift(n).each{|w|trie.insert *w.split}
puts t.shift(q).map{|w|trie.get_value w}


=begin
この問題ではキーである文字列 S に紐づけられた意味を得るためのメンバ関数 get_value(key: string): string を作成してください。


N 個の文字列 S_1, ..., S_N と文字列 T_1, ..., T_N が与えられます。i 個目の単語は S_i でその意味は T_i です。
S_i はアルファベット小文字のみで構成される文字列です。T_i は空白や改行を除く半角英数字記号 ( ASCII 印字可能文字の一部) で構成されています。
より詳細には T_i はこれらの文字で構成されています。

0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~

また、入力によって 1 つの単語に複数の意味が与えられることはありません。

次に Q 個のクエリが与えられるので、与えられた順番に処理してください。
・ ある単語 W が与えられるので、W の意味を出力してください。
・ ただし、W が S_1, ..., S_N に含まれていない単語である場合は NOTFOUND と出力してください。
▼　下記解答欄にコードを記入してみよう

入力される値
N Q
S_1 T_i
...
S_N T_N
qurey_1
...
query_Q


・ 1行目に N, Q が与えられます。続く N 行に文字列 S_i と T_i が空白区切りで与えられます。
・ その後に Q 行のクエリが与えられます。各クエリは
W
の形式で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
i行目にはi番目のクエリに対する出力を行ってください。
また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて, 以下の条件をみたします

・1 ≦ N, Q ≦ 10^3
・S_i, W はアルファベット小文字で構成される文字列
・T_i は半角英数字記号または ASCII 印字可能文字で構成される文字列
・1 ≦ |S_i|, |T_i|, |W_i| ≦ 10^3 (|S_i|は、Sの文字数です。)
・S_i≠S_j (i≠j)

入力例1
4 5
t 20th_alphabet
test exam
testing do_test
tester person_doing_the_test
t
test
testing
tester
subject

出力例1
20th_alphabet
exam
do_test
person_doing_the_test
NOTFOUND

入力例2
4 5
one 1
two 2
minus -
today YYYY/MM/DD
one
two
minus
today
tomorrow

出力例2
1
2
-
YYYY/MM/DD
NOTFOUND
=end