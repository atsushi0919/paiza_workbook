# ナンバープレートのハッシュ値 (paizaランク C 相当)
# https://paiza.jp/works/mondai/hash_advanced/hash_advanced__number_plate

INPUT1 = <<"EOS"
shinagawa
813
wo
4649
EOS
OUTPUT1 = <<"EOS"
181
EOS

INPUT2 = <<"EOS"
shinagawa
428
ha
3150
EOS
OUTPUT2 = <<"EOS"
466
EOS

# ハッシュ値を返す
def hash(s1, i1, s2, i2)
  (s1.chars.map(&:ord).sum * i1 + s2.chars.map(&:ord).sum * i2) % 1000
end

# 入力
s1, i1, s2, i2 = $stdin.read.split

# ハッシュ値を出力
puts hash(s1, i1.to_i, s2, i2.to_i)

=begin
これまで扱ったハッシュ関数は、整数値や文字列など、1 種類のデータ型を入力としてとっていたと思います。
ハッシュ関数は、様々なデータが入力として与えられ、データ型は 1 種類とは限りません。
本問では、整数値と文字列が組み合わさった車のナンバープレートを入力とするハッシュ関数を実装してみましょう。

ナンバープレートには地域名、分類番号、ひらがな、一連指定番号が記載されています。
s_1 (地域名)、i_1 (分類番号)、s_2 (ひらがな)、i_2 (一連指定番号)が与えられます。
以下のハッシュ関数 H を用いてハッシュ値を計算してください。ただし、地域名とひらがなは半角英小文字で与えられることに注意してください。


H(s_1, i_1, s_2, i_2) = (s_1 の各文字の文字コードの和 * i_1 + s_2 の各文字の文字コードの和 * i_2) % 1000


文字コードとは、コンピュータで文字を扱うため 1 文字ごとにあたえた識別番号で、ASCII、Shift_JIS、UTF-8 等の種類があります。
本問では、ASCII に従って文字列を整数に変換してください（例：a → 97）。
多くの言語にも文字を文字コード（ASCII コード) に変換する手法が用意されているので、それらを使って実装してみましょう。
例えば、Python3 では ord() を使って文字を文字コードに変換することができます。

▼　下記解答欄にコードを記入してみよう
入力される値
s_1
i_1
s_2
i_2s

1 行目に地域名を表す文字列 s_1 が与えられます。

2 行目に分類番号を表す整数 i_1 が与えられます。

3 行目にひらがなを表す文字列 s_2 が与えられます。

4 行目に一連指定番号を表す整数 i_2 が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
上記のハッシュ関数で計算されるハッシュ値を 1 行で出力してください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

H(s_1, i_1, s_2, i_2)
条件
すべてのテストケースにおいて、以下の条件をみたします。


s_1 は、半角英小文字からなる 3 文字以上 11 文字以下の文字列

0 ≦ i_1 ≦ 999

s_2 は、半角英小文字からなる 1 文字以上 3 文字以下の文字列

0 ≦ i_2 ≦ 9999


簡単のため、本来のナンバープレートに記載されている条件とは異なります。
入力例1
shinagawa
813
wo
4649

出力例1
181

入力例2
shinagawa
428
ha
3150

出力例2
466
=end
