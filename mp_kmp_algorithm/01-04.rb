# 問題 4 : 文字列検索 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/mp_kmp_algorithm/mp_kmp_algorithm__naive_step4

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

# 接頭辞・接尾辞の最長共通数列の長さを返す
def num_of_common_chars(a)
  n = a.length

  (1...n).each { |i| return n - i if a[..n - i - 1] == a[i..] }

  return 0
end

# 入力
s, t = $stdin.read.split
s_len = s.length
t_len = t.length

# s_i (0 <= i < n) について接頭辞・接尾辞の最長共通数列の長さを求める
table = (0...s_len).map { |i| num_of_common_chars(s[..i]) }

# i: 開始位置, j: 一致文字数
i = j = 0
partial_match = false
while i + j < t_len
  if t[i + j] == s[j]
    j += 1
    if j == s_len
      partial_match = true
      break
    end
  else
    if j == 0
      i += 1
    else
      i = i + j - table[j - 1]
      j = table[j - 1]
    end
  end
end

puts partial_match ? "Yes" : "No"

=begin
S = gets.chomp
T = gets.chomp
res = false

(0..(T.size - S.size)).each do |i|
  is_same = true
  (0..(S.size - 1)).each do |j|
    is_same = false if (T[i + j] != S[j])
    break if (!is_same)
  end

  if (is_same)
    res = true
    break
  end
end

if (res)
  puts "Yes"
else
  puts "No"
end

問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
英小文字から 2 つの文字列 S と T が入力として与えられます。
文字列 S が文字列 T に現れるかどうかを判定してください。

つまり、文字列 T の部分文字列のうち、文字列 S と一致するものが存在するかどうかを判定してください。

S = ask
T = paizaskillcheck
の場合、S = ask は T の 5 文字目から 7 文字目までの部分文字列なので、S は T に現れます。

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
余計な文字や空白、空行を出力しないようにしてください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・1 ≦ |S| ≦ 300
・1 ≦ |T| ≦ 10^5
・|S| ≦ |T|
・|S|, |T| はそれぞれ文字列 S の長さと文字列 T の長さを表します。
・S, T は英小文字のみからなる文字列

入力例1
ask
paizaskillcheck

出力例1
Yes 
=end
