# Q2: rot-x (paizaランク C 相当)
# https://paiza.jp/works/mondai/vantan_2021/vantan_2021__q2_rot-x

INPUT1 = <<~"EOS"
  3
  abc
  zab
EOS
OUTPUT1 = <<~"EOS"
  correct rot-25
EOS

INPUT2 = <<~"EOS"
  3
  abc
  zbb
EOS
OUTPUT2 = <<~"EOS"
  fixed zab
EOS

INPUT3 = <<~"EOS"
  3
  abc
  zbc
EOS
OUTPUT3 = <<~"EOS"
  fixed abc
EOS

INPUT4 = <<~"EOS"
  3
  abc
  zcc
EOS
OUTPUT4 = <<~"EOS"
  incorrect
EOS

radix = 26
chr_base = 97
n, s, t = STDIN.read.split
n = n.to_i

rots = Array.new(n)
0.upto(n - 1) do |i|
  rots[i] = (t[i].ord - s[i].ord) % radix
end

case rots.uniq.length
when 1
  puts "correct rot-#{rots[0]}"
when 2
  tally = rots.tally.sort_by { |k, v| v }
  idx = rots.index(tally[0][0])
  rot = tally[1][0]
  t[idx] = ((s[idx].ord + rot - chr_base) % radix + chr_base).chr
  puts "fixed #{t}"
else
  puts "incorrect"
end

=begin
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
※この問題は、2021年1月に開催されたP共通テスト（バンタンテックフォードアカデミー中高プログラミング共通テスト）で出題された問題です。

シーザー暗号に代表される換字式暗号は、アルファベットの文字を決まった文字数分シフトさせて置き換える、古典的で非常に単純な暗号です。
なお、シフトとはアルファベット順で隣の文字にずらすことを指します。
アルファベット順で次の文字 (z の次は a) にずらすことを右シフト、前の文字 (a の前は z) にずらすことを左シフトと呼ぶことにします。
例えば、平文 yellow の各文字を 4 文字右にシフトして暗号化すると cippsa となります。これを復元するには、逆に 4 文字左シフトすればよいです。

ここで、アルファベットを 右にx (0 ~ 25) 文字シフトしたシーザー暗号を、rot-x と呼ぶことにします。
たとえば、平文 yellow に対する暗号文 cippsa は rot-4 、lryybj は rot-13 です。

平文 s と暗号文 t が与えられます。この暗号文 t が rot-何 であるかを求めてください。
つまり、平文 s の各文字を何文字右にシフトしたら暗号文 t が得られるかを求めてください。
ただし、この暗号文 t は間違っている可能性があるため、以下のように処理してください。

・暗号文が正しい場合 (ある 0 以上 25 以下の整数 x について、s の各文字を x 文字右シフトしたものが t と一致する場合)
　　rot-x (x は 0 以上 25 以下の整数) を求め、correct rot-x と出力してください。
・1 文字のみ間違っている場合
　　その 1 文字を修正し、正しい暗号文 t' を作り fixed t' と出力してください。
・2 文字以上間違っている場合
　　incorrect と出力してください。


例えば、s = hello に対して

t = jgnnq の場合は correct rot-2と、

t = kgnnq の場合は fixed jgnnqと、

t = khnnq の場合は incorrectと出力してください。
▼　下記解答欄にコードを記入してみよう

入力される値
n
s
t


1 行目に、平文と暗号文の長さ n が与えられます。
2行目に、平文 s が与えられます。
3行目に、暗号文 t が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
平文 s に対応する暗号文 t が正しい場合は、rot x (x は 0 以上 25 以下の整数) を求め、correct rot-x と出力してください。
1 文字のみ間違っている場合は、その 1 文字を修正した正しい暗号文 t' を用いて fixed t' と出力してください。
2 文字以上間違っている場合は、incorrect と出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 入力はすべて整数
・ 3 ≦ n ≦ 200,000
・ s, t は小文字アルファベット ('a', 'b', ... 'z') のみからなる
・ s, t の長さは n
・ s ≠ t

入力例1
3
abc
zab

出力例1
correct rot-25

入力例2
3
abc
zbb

出力例2
fixed zab

入力例3
3
abc
zbc

出力例3
fixed abc

入力例4
3
abc
zcc

出力例4
incorrect
=end
