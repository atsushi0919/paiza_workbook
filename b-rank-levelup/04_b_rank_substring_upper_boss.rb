# 指定範囲だけ大文字 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prob60/substring_upper_9

<<"EOS"

入力例1
2 6
this is a pen

出力例1
tHIS Is a pen

入力例2
2 6
Welcome to the paiza! I`m studying ruby!

出力例2
WELCOMe to the paiza! I`m studying ruby!

入力例3
1 10
Welcome to the paiza! I`m studying ruby!

出力例3
WELCOME TO the paiza! I`m studying ruby!

EOS

a, b = gets.split.map(&:to_i)
s = gets.chomp

(a..b).each do |idx|
  s[idx - 1] = s[idx - 1].upcase
end
puts s

=begin
a, b = gets.split.map(&:to_i)
s = gets.chomp

s[a - 1..b - 1] = s[a - 1..b - 1].upcase
puts s
=end

def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  a, b = input_lines.shift.split.map(&:to_i)
  s = input_lines.shift

  # 指定範囲を大文字で上書きする
  (a..b).each do |idx|
    s[idx - 1] = s[idx - 1].upcase
  end

  # 文字列の末尾に改行を追加する
  s << "\n"
end

puts solve(STDIN.read)

=begin
指定範囲だけ大文字 (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/substring_upper_9
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
スペース区切りの2つの整数と、文字列が入力されます。2つの整数の範囲の部分文字列を、大文字にして出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

a b
s


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
文字列 s の a 文字目から b 文字目を大文字にして、文字列 s を出力してください。
文字列 s に含まれる記号やスペースは、変形せずそのまま出力します。

最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≦ a ≦ b ≦ (文字列 s の長さ) ≦ 100
文字列 s は、半角英数字・半角記号スペースで構成されます。

入力例1
2 6
this is a pen

出力例1
tHIS Is a pen

入力例2
2 6
Welcome to the paiza! I`m studying ruby!

出力例2
WELCOMe to the paiza! I`m studying ruby!

入力例3
1 10
Welcome to the paiza! I`m studying ruby!

出力例3
WELCOME TO the paiza! I`m studying ruby!
=end
