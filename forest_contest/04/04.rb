# オルタネーティングキャップス (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_004/forest_contest_004__alternating_caps

INPUT1 = <<"EOS"
pAIza
EOS

OUTPUT1 = <<"EOS"
paiza
EOS

# 解答例
puts gets.downcase

# https://jaigotec.com/paiza-forest_contest_003/
# 3 問目

=begin
オルタネーティングキャップス (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_004/forest_contest_004__alternating_caps
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
昔日本の若者の間で流行ったギャル文字の一種に、あいうえおつやゆよわをぁぃぅぇぉっゃょゎで表記する、小文字文化と呼ばれるものがあります。
例えば、おいしいおやつをぉぃしぃぉゃっのように表記します。

似たような文化として、alternating caps と呼ばれる表記法があります。これは、大文字と小文字を混ぜて文章を書く表記のことで、
例えばprogrammingをPRogrAmMiNGのように表記します。

alternating caps は読みにくいので、alternating caps で表記された英単語をすべて小文字に変換するプログラムを書いてください。

▼　下記解答欄にコードを記入してみよう

入力される値
s

・ 1 行目に、alternating caps を用いて表記された英単語 s が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
s をすべて小文字に変換し、1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ s は英小文字または英大文字から構成される
・ 3 ≦ (s の長さ) ≦ 10

入力例1
pAIza

出力例1
paiza
=end
