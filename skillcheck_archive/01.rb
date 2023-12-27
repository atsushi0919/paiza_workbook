# 【殿堂入りキャンペーン】Eメールアドレス (paizaランク D 相当)
# https://paiza.jp/works/mondai/skillcheck_archive/email_address

$><<`dd`.split*?@

=begin
Eメールアドレスとはローカル部とドメインを「@」を繋いだ文字列で表されます。

ローカル部を s ,ドメインを t として、それぞれ長さ n の文字列が改行区切りで入力されます。

以下の構文に沿った文字列を出力してください。

s(ローカル部)@t(ドメイン)

例えば

info
paiza.jp

のような入力の場合

info@paiza.jp

と出力して下さい。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

s
t


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
ローカル部とドメインから以下の構文に沿った文字列を出力してください。

s(ローカル部)@t(ドメイン)

最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ n ≦ 64

s , t は半角英数と「.」(半角ドット)で構成された文字列です。

入力例1
paiza
example.com

出力例1
paiza@example.com

入力例2
paiza.tarou2015
paiza.jp

出力例2
paiza.tarou2015@paiza.jp
=end