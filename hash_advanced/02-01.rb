# ログイン認証をしてみよう (paizaランク B 相当)
# https://paiza.jp/works/mondai/hash_advanced/hash_advanced__certification

INPUT1 = <<"EOS"
4 2
apple 925315561
banana 988302243
chocolate 635314873
donut 459428080
apple apple
banana bacon
EOS
OUTPUT1 = <<"EOS"
Yes
No
EOS

INPUT2 = <<"EOS"
4 2
apple 925315561
banana 988302243
chocolate 635314873
donut 459428080
eggplant eggplant
fudge apple
EOS
OUTPUT2 = <<"EOS"
No
No
EOS

# 定数
B = 10 ** 8 + 7
MOD = 10 ** 9 + 7

# ハッシュを返す
def hash(password)
  tmp = 0
  password.chars.each.with_index(1) do |c, i|
    tmp += c.ord * B ** i
  end
  tmp % MOD
end

# 入力
input_lines = $stdin.read.split("\n")
n, m = input_lines.shift.split.map(&:to_i)
ah = input_lines.shift(n).map { |r| r.split }
bp = input_lines.shift(m).map(&:split)

# データベース情報
table = ah.map { |account, hash| [account, hash.to_i] }.to_h

# ログイン処理
bp.each do |account, password|
  hash_from_password = hash(password)
  puts table[account] == hash_from_password ? "Yes" : "No"
end

# p hash("apple")

=begin
私たちの身の回りでよく使われているハッシュ技術の一つがパスワード管理です。
私たちは何かのサービス等に登録するとき、アカウントとパスワードを登録します。
そのとき、ウェブサーバはパスワードをハッシュ化したものをデータベースに保管しています。
ハッシュ化したパスワードから元のパスワードを特定することは非常に難しいため、個人情報の保護に役立っています。
本問では、ハッシュ化したパスワードとアカウントでのログイン認証をおこなってみましょう。

まずデータベースの情報として、N 個のアカウント名 A_i とパスワードのハッシュ値 h_i の組 (1 ≦ i ≦ N) が与えられます。
その後、M 個のアカウント名 B_j とパスワードの組 p_j (1 ≦ j ≦ M) が与えられます。
これら M 個の組がデータベースに登録してあるアカウント情報と一致する、つまりログイン可能ならば Yes、
そうでないならば No と出力してください。
ただし、h_i (1 ≦ i ≦ N) はあるパスワード p を次のハッシュ関数 H を用いてハッシュ化したものです。

文字列 p の長さを m として、

H(p) = (p の 1 文字目の文字コード * B1 + p の 2 文字目の文字コード * B2 + ... + p の m 文字目の文字コード * Bm) % mod

ただし、B = 10^8+7, mod = 10^9+7 とし、文字コードは ASCII に従って変換してください。
▼　下記解答欄にコードを記入してみよう

入力される値
N M
A_1 h_1
A_2 h_2
...
A_N h_N
B_1 p_1
B_2 p_2
...
B_M p_M

1 行目に組の数を表す整数 N と M が与えられます。

i + 1 行目にデータベースで保管しているアカウント名を表す文字列 A_i と
それに対応するパスワードのハッシュ値を表す整数 h_i が与えられます。(1 ≦ i ≦ N)

j + N + 1 行目にログイン認証を行うアカウント名を表す文字列 B_j とパスワードを表す文字列 p_j が与えられます。(1 ≦ j ≦ M)

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
M 行出力してください。j (1 ≦ j ≦ M) 行目には、アカウント名 B_i とパスワード p_i でログイン可能ならば Yes、
そうでないならば No と出力してください。

また、末尾に改行をいれ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。


1 ≦ M ≦ N ≦ 2500

A_i は半角英数字で構成される長さ 5 以上 15 以下の文字列 (1 ≦ i ≦ N)

0 ≦ h_i ≦ 1,000,000,006 (1 ≦ i ≦ N)

B_j, p_j は半角英数字で構成される長さ 5 以上 15 以下の文字列 (1 ≦ j ≦ M)

データベースにはあるアカウント名は、高々 1 つである。(i1 ≠ i2 ならば、A_i1 ≠ A_i2)
入力例1
4 2
apple 925315561
banana 988302243
chocolate 635314873
donut 459428080
apple apple
banana bacon

出力例1
Yes
No

入力例2
4 2
apple 925315561
banana 988302243
chocolate 635314873
donut 459428080
eggplant eggplant
fudge apple

出力例2
No
No
=end
