# 問題 7 : 文字列検索 3 (paizaランク A 相当)
# https://paiza.jp/works/mondai/mp_kmp_algorithm/mp_kmp_algorithm__a_little_fast_boss

INPUT1 = <<"EOS"
ask
paizaskillcheck
EOS
OUTPUT1 = <<"EOS"
Yes
EOS

INPUT2 = <<"EOS"
asask
pasaslasask
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

def kmp(t, s)
  matched_indices = false
  table = kmp_table(s)
  i = j = 0
  t_l = t.length
  s_l = s.length

  while i + j < t_l
    if s[j] == t[i + j]
      j += 1
      if j == s_l
        matched_indices = true
        i += j - table[j]
        j = table[j]
      end
    else
      i += j - table[j]
      if j > 0
        j = table[j]
      end
    end
  end
  matched_indices
end

# 入力
# _, s = $stdin.read.split
# 出力
p kmp("paizaskillcheckask", "ask")

=begin
def kmp(s, t):
    matched_indices = []
    tbl = make_kmp_table(t)
    i = 0
    j = 0
    n = len(s)
    m = len(t)
    while i + j < n:
        if t[j] == s[i + j]:
            j += 1
            if j == m:
                matched_indices.append(i)
                i += j - tbl[j]
                j = tbl[j]
        else:
            i += j - tbl[j]
            if j > 0:
                j = tbl[j]
    return matched_indices

問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
英小文字から２つの文字列 S と T が入力として与えられます。
文字列 S が文字列 T に現れるかどうかを判定してください。

つまり、文字列 T の部分文字列のうち、文字列 S と一致するものが存在するかどうかを判定してください。

S = ask
T = paizaskillcheck
の場合、S = ask は T の 5 文字目から 7 文字目までの部分文字列なので、S は T に現れます。

ヒント :
明らかに S と一致しなさそうな部分を比較するのは無駄なので、S が含まれる可能性がある部分だけ見たい!!!
1 つ前の問題で求めた答えを見たら何かわかるかも??

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます

S
T

1 行目には文字列 S が、2 行目には文字列 T が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
S が T の部分文字列のうちいずれかと一致するなら Yes を、そうでないなら No を一行で出力してください。
ただし、末尾には改行を入れ、
余分な文字や空白、空行を出力しないようにしてください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・1 ≦ |S| ≦ 5000
・1 ≦ |T| ≦ 2×10^6
・|S| ≦ |T|
・|S|, |T| はそれぞれ文字列 S の長さと文字列 T の長さを表します。
・S, T は英小文字のみからなる文字列

入力例1
ask
paizaskillcheck

出力例1
Yes
=end
