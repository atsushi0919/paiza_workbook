# 問題 10 : 一致する接頭辞と接尾辞 6 (paizaランク S 相当)
# https://paiza.jp/works/mondai/mp_kmp_algorithm/mp_kmp_algorithm__mp_boss

INPUT1 = <<"EOS"
10
fizzfizzfi
EOS
OUTPUT1 = <<"EOS"
0
0
0
0
1
2
3
4
1
2
EOS

def kmp_table(s)
  i = 2
  j = 0
  s_l = s.length

  table = Array.new(s_l, 0)
  table[0] = -1
  while i <= s_l
    if s[i - 1] == s[j]
      table[i] = j + 1
      i += 1
      j += 1
    elsif j > 0
      j = table[j]
    else
      table[i] = 0
      i += 1
    end
  end

  table
end

# 入力
n, s = INPUT1.split
# n, s = $stdin.read.split
n = n.to_i

# 前処理
table = kmp_table(s)

require "byebug"
debugger

hash = {}
(2..n).each do |i|
  if table[i] > 0
    key = s_i = s[..table[i - 1]]
    val = table[i]
    while hash[key]
      val = hash[key]
      key = s[..hash[key]]
    end
    hash[key] = val
  end
end

p hash

# 出力
# puts table[1..].join("\n")

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
英小文字からなる長さ N の文字列 S が入力として与えられるので、1 ≦ i ≦ N を満たすすべての i それぞれについて、以下の答えを出力してください。
・S の 1 文字目から i 文字目までの部分文字列を T_{i} とする。T_{i} の接頭辞であり、接尾辞でもあり、
なおかつその接尾辞と接頭辞が T_{i} 上で共通部分を持たないような文字列のうち、最長のものの長さ

例えば S = abababbb に対して i = 6 の場合、
S の 1 文字目から i 文字目までの連続部分列は ababab なので、
・接頭辞 : { φ, a, ab, aba, abab, ababa }
・接尾辞 : { φ, b, ab, bab, abab, babab }

となり、どちらにも含まれていて元の文字列上で共通部分を持たない文字列は ab と φ なので、2 が答えになります。
ここで、文字列ababは接頭辞であり接尾辞でもあるのですが、文字列 ababab 上の 3 文字目から 4 文字目までの共通部分を持つので条件を満たしません。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます

N
S

1 行目には文字列の長さを表す整数 N が与えられ、2 行目には文字列 S が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1 ≦ i ≦ N を満たす i それぞれについて、
i 行目に
・S の 1 文字目から i 文字目までの部分文字列を T_{i} とする。T_{i} の接頭辞であり、接尾辞でもあり、なおかつその接尾辞と接頭辞が T_{i} 上で共通部分を持たないような文字列のうち、最長のものの長さを表す整数
を出力してください。
ただし、最後には改行を入れ、
余計な文字や空白、空行を出力しないようにしてください。

条件
すべてのテストケースにおいて、以下の条件を満たします。
・2 ≦ N ≦ 500000
・S は英小文字のみからなる文字列

入力例1
10
fizzfizzfi

出力例1
0
0
0
0
1
2
3
4
1
2
=end
