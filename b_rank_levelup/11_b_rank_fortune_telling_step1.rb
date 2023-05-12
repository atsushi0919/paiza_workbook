# 連想配列（辞書）を使う (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/fortune_telling_0

users = {
  "Kyoko" => "B",
  "Rio" => "O",
  "Tsubame" => "AB",
  "KurodaSensei" => "A",
  "NekoSensei" => "A",
}

# [解答例1]
# users.each { |key, val| puts "#{key} #{val}" }

# [解答例2]
# users.each { |user| puts user.join(" ") }

=begin
連想配列（辞書）を使う (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/fortune_telling_0
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
次のような「ユーザー」と「ユーザーに対応する血液型」を連想配列（辞書）として定義して、それらのキーと値のペアを順に出力してください。


ユーザー	ユーザーに対応する血液型
Kyoko	B	
Rio	O	
Tsubame	AB	
KurodaSensei	A	
NekoSensei	A	
▼　下記解答欄にコードを記入してみよう

入力される値
なし


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
各ユーザーについて順に、ユーザーとユーザーに対応する血液型を半角スペース区切りで出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
=end
