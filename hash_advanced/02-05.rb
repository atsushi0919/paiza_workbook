# ローリングハッシュを実装してみよう (paizaランク A 相当)
# https://paiza.jp/works/mondai/hash_advanced/rolling_advanced__hash2

INPUT1 = <<"EOS"
5 4
paiza
b
ai
pizza
paiza
EOS
OUTPUT1 = <<"EOS"
No
Yes
No
Yes
EOS

INPUT2 = <<"EOS"
10 5
1234567890
59
9346
2
764
23
EOS
OUTPUT2 = <<"EOS"
No
No
Yes
No
Yes
EOS

# 定数
B = 10 ** 8 + 7
MOD = 10 ** 9 + 7

# ローリングハッシュ値を返す
def hash(s)
  m = s.length
  tmp = 0
  s.chars.each.with_index(1) do |c, i|
    tmp += c.ord * B ** (m - i)
  end
  tmp % MOD
end

# 入力
input_lines = $stdin.read.split("\n")
l, n = input_lines.shift.split.map(&:to_i)
s, *t = input_lines

# t は s の部分文字列か？
table = Hash.new { [] }
results = t.map do |ti|
  len_t = ti.length
  # 文字長 len_t の文字列を調べたことがあるか？
  if table[len_t].empty?
    # ないなら s から len_t 文字のローリングハッシュを生成して記録
    0.upto(l - len_t) do |j|
      table[len_t] <<= hash(s.slice(j, len_t))
    end
  end

  # 文字列 ti のローリングハッシュと合致するか？
  table[len_t].include?(hash(ti))
end

# 出力
puts results.map { |res| res ? "Yes" : "No" }.join("\n")

=begin
解説（解法のポイント）
方針
長さが m の文字列のハッシュ値の計算には O(m) かかるため、
長さが L の文字列 S の長さが m の部分文字列のハッシュ値の計算には O(Lm) かかり、
これはそれぞれの t_i について愚直に 1 文字ずつ判定する方法と変わらないため工夫が必要です。

まず前問でやったように文字列 S の 1 文字目から i 文字目 (1 ≦ i ≦ L) までの部分文字列のハッシュ値を計算しましょう。

そうすると、文字列 S の p 文字目から q 文字目 (2 ≦ p ＜ q ≦ L) までの ハッシュ値 H([p,q]) は、
1 文字目から p-1 文字目までのハッシュ値 H(s_{p-1}) と 1 文字目から q 文字目までのハッシュ値 H(s_q) を使って、
次のように表すことができます。

H([p,q]) = ( H(s_q) - H(s_{p-1}) * B^(q-p+1) ) % mod

少し難しいですが、自分で式を展開してみると理解しやすいと思います。
したがって、t_i のハッシュ値が文字列 S のある区間 [p,q] 
(ただし、[p,q] と t_i の長さは同じ) のハッシュ値 H([p,q]) に一致するかどうか調べることで、
t_i が S の部分文字列かどうか判定することができ、この計算量は O(L) となります。

実装例
Python3 の場合
B = 100000007
mod = 1000000007
l,n = map(int,input().split())
s = input()
H = [0]
for i in range(l):
  h_value = (H[-1]*B + ord(s[i])) % mod
  H.append(h_value)
def Hash(t):
    ans = 0
    for i in range(len(t)):
        ans += (ord(t[i])*B**(len(t)-i-1)) % mod
    return (ans%mod)
for i in range(n):
    t = input()
    t_l = len(t)
    t_value = Hash(t)
    for i in range(l-t_l+1):
        if t_value == (H[t_l+i] - H[i] * B**(t_l)) % mod:
            print('Yes')
            break
    else:
        print('No')
i = 0 のとき、H[0] = 0 となるため、S の調べたい部分文字列が先頭から始まっていても場合分けする必要はありません。
=end

=begin
ハッシュ関数は文字列検索を高速におこなうアルゴリズムに応用することができます。そのアルゴリズムがローリングハッシュです。
本問では、このローリングハッシュを実装してみましょう。

長さが L の文字列 S が与えられます。その後、N 個の文字列 t_i (1 ≦ i ≦ N) が与えられます。
文字列 S の中に t_i が部分文字列として含まれるかどうか以下のハッシュ関数 H を用いて判定し、含まれているならば Yes、
含まれていないならば No とそれぞれについて出力してください。

文字列 s の長さを m として、

H(s) =
  (s の 1 文字目の文字コード * B^(m-1) + s の 2 文字目の文字コード * B^(m-2) + ... + s の m 文字目の文字コード * B^0) % mod

ただし、B = 108+7, mod = 109+7 とし、文字コードは ASCII に従って変換してください。
また、同じ長さの 2 つの文字列 a と b のハッシュ値 H(a) と H(b) が一致したならば、a と b は同一の文字列であるとします。
▼　下記解答欄にコードを記入してみよう

入力される値
L N
S
t_1
t_2
...
t_n

1 行目に、文字列 S の長さを表す整数 L と、調べたい文字列の数を表す整数 N が与えられます。

2 行目に、長さ L の文字列 S が与えられます。

i + 2 行目に、調べたい文字列 t_i が与えられます。(1 ≦ i ≦ N)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
N 行出力してください。i (1 ≦ i ≦ N) 行目には、文字列 t_i が文字列 S の部分文字列として含まれているならば Yes、そうでないならば No と出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


1 ≦ L ≦ 20_000

1 ≦ N ≦ 100

S は半角英数字で構成される長さ L の文字列

t_i は半角英数字で構成される長さ 1 以上 10 以下の文字列 (1 ≦ i ≦ N)
入力例1
5 4
paiza
b
ai
pizza
paiza

出力例1
No
Yes
No
Yes

入力例2
10 5
1234567890
59
9346
2
764
23

出力例2
No
No
Yes
No
Yes
=end
