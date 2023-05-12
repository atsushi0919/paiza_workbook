# ユーザーの血液型のデータ処理 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prob60/fortune_telling_1

<<~"EOS"

入力例1
5
Kyoko B
Rio O
Tsubame AB
KurodaSensei A
NekoSensei A

出力例1
Kyoko B
Rio O
Tsubame AB
KurodaSensei A
NekoSensei A

入力例2
5
shishiza O
yagiza O
otomeza AB
mizugameza B
futagoza A

出力例2
shishiza O
yagiza O
otomeza AB
mizugameza B
futagoza A

入力例3
3
AAA A
BBB B
CCC A

出力例3
AAA A
BBB B
CCC A

EOS

# [解答例1]
n = gets.to_i
users = {}
n.times do
  name, blood_type = gets.split
  users[name] = blood_type
end

users.each { |key, val| puts "#{key} #{val}" }
=end

# [解答例2]
n = gets.to_i
users = n.times.map { gets.split }.to_h

users.each { |user| puts user.join(" ") }

=begin
ユーザーの血液型のデータ処理 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/fortune_telling_1
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
n 行のユーザーと血液型の組が与えられるので、ユーザーをキー、血液型を値として、連想配列（辞書）に保存してください。
そのあとで連想配列（辞書）をそのまま表示してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。
n
A_1 B_1
A_2 B_2
...
A_i B_i
...
A_n B_n


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1からnまでの各ユーザーについて順に、ユーザーと血液型を表示してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ n ≦ 100
・1 ≦ A_i の長さ ≦ 50
・B_i は "A", "B", "AB", "O" のいずれか

入力例1
5
Kyoko B
Rio O
Tsubame AB
KurodaSensei A
NekoSensei A

出力例1
Kyoko B
Rio O
Tsubame AB
KurodaSensei A
NekoSensei A

入力例2
5
shishiza O
yagiza O
otomeza AB
mizugameza B
futagoza A

出力例2
shishiza O
yagiza O
otomeza AB
mizugameza B
futagoza A

入力例3
3
AAA A
BBB B
CCC A

出力例3
AAA A
BBB B
CCC A
=end
