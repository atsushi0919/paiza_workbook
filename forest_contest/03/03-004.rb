# 入出力例
INPUT1 = <<"EOS"
3
a
shift b
c
EOS
OUTPUT1 = <<"EOS"
aBc
EOS

INPUT2 = <<"EOS"
7
a
capslock
b
c
d
capslock
f
EOS
OUTPUT2 = <<~"EOS"
  aBCDf
EOS

# 解答例1
# 入力
n = gets.to_i
c = n.times.map { gets.split }

display = ""
capslock = false
# n 行の入力で繰り返し処理
c.each do |keys|
  key1, key2 = keys
  case key1
  when "capslock"
    # capslock の ON/OFF 切り替え
    capslock = !capslock
  when "shift"
    # shift と一緒に押されたキーの大文字を display に追加
    display <<= key2.upcase
  else
    # capslock ON なら大文字, OFF なら小文字を display に追加
    display <<= capslock ? key1.upcase : key1
  end
end

# 出力
puts display

=begin
キーボードのシミュレーション (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__c_keyboard
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
あなたは、以下のようなキーボードのシミュレーションをするプログラムを作成したいと考えました。

・キーは a, b, ..., z と shift, capslock のみ
・a, b, ..., z キーと shiftキーを同時に押すと、対応する大文字が出力される
・capslockキーを押すと、再びcapslockキーが押されるまで大文字が出力される

キーボードで押されたキーが入力として与えられるので、

パソコンの画面に表示される文字列を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます

n
c_1
c_2
...
c_n

・入力される文字列数n
・c_1, c_2, ..., c_n は押下されたキー
・入力はn + 1行となり、末尾に改行を一つ含みます。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
押したキーによって表示される文字列を1行で表し、
最後に改行して出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≤ n ≤ 10
c_1, c_2, ..., c_n は、以下のいずれかの文字列です。
・x
・shift x
・capslock
ただし、xは小文字アルファベット1文字（a, b, ..., z）を表します。

ただし、必ず何らかの文字列が表示されるものとし、
また、capslockキーが有効なときshiftキーは押されないものとします。

入力例1
3
a
shift b
c

出力例1
aBc

入力例2
7
a
capslock
b
c
d
capslock
f

出力例2
aBCDf
=end
