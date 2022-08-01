# アルファベット探し (paizaランク C 相当)
# https://paiza.jp/works/mondai/prob60/alphabets_large_or_small_9

INPUT1 = <<~"EOS"
  A
  D
  C
EOS
OUTPUT1 = <<~"EOS"
  true
EOS

INPUT2 = <<~"EOS"
  D
  D
  D
EOS
OUTPUT2 = <<~"EOS"
  true
EOS

INPUT3 = <<~"EOS"
  A
  D
  Z
EOS
OUTPUT3 = <<~"EOS"
  false
EOS

def solve(input_lines)
  # 入力データ受け取り
  x, y, c = input_lines.split

  # x と y の間に c が含まれているか
  result = if x <= c && c <= y
      "true"
    else
      "false"
    end

  # 判定結果の末尾に改行を追加
  result << "\n"
end

puts solve(STDIN.read)

exit

=begin
def solve(input_lines)
  # 入力データ受け取り
  x, y, c = input_lines.split

  # x と y の間に c が含まれているか
  result = if x <= c && c <= y
      "true"
    else
      "false"
    end

  # 確認用コード
  result
end
=end

def solve(input_lines)
  # 入力データ受け取り
  x, y, c = input_lines.split

  # x と y の間に c が含まれているか
  (x..y).include?(c).to_s
end

puts solve(STDIN.read)

=begin
# [解答例1]
x = gets.chomp
y = gets.chomp
c = gets.chomp


=end

=begin
# [解答例2]
x = gets.chomp
y = gets.chomp
c = gets.chomp

puts (x..y).include?(c) ? "true" : "false"
=end

=begin
アルファベット探し (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/alphabets_large_or_small_9
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
1行目の英大文字 X から、2行目の英大文字 Y の範囲に3行目のアルファベット C が含まれていれば"true", 
そうでなければ"false"と出力してください。
X が Y よりもアルファベット順で後ろになる場合(X = 'G', Y = 'F'のときなど)も"false"と出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

X
Y
C

入力値最終行の末尾に改行が１つ入ります。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
出力は、 "true" または "false" のどちらかです。

条件
・X, Y, Cはそれぞれ英大文字です。

INPUT1 = <<~"EOS"
A
D
C

INPUT1 = <<~"EOS"
true

INPUT2 = <<~"EOS"
D
D
D

INPUT2 = <<~"EOS"
true

INPUT3 = <<~"EOS"
A
D
Z

INPUT3 = <<~"EOS"
false
=end
