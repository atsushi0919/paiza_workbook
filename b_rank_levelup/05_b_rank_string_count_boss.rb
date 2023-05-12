# 文字の重複カウント (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/string_count_9

INPUT1 = <<~"EOS"
  A
  abdeeAAbAAAbfde
EOS
OUTPUT1 = <<~"EOS"
  5
EOS

INPUT2 = <<~"EOS"
  1
  abc123
EOS
OUTPUT2 = <<~"EOS"
  1
EOS
INPUT3 = <<~"EOS"
  5
  122333444455555
EOS
OUTPUT3 = <<~"EOS"
  5
EOS

def solve(input_lines)
  # 入力データ受け取り
  c, s = input_lines.split

  # 文字列s の先頭から順に文字c と一致するかを調べる
  n = s.length
  result = 0
  (0..n - 1).each do |idx|
    result += 1 if s[idx] == c
  end

  # 文字列に変換して末尾に改行を追加する
  result.to_s << "\n"
end

puts solve(STDIN.read)

exit

=begin
# [解答例1]
def solve(input_lines)
  c, s = input_lines.split

  n = s.length
  result = 0
  (0..n - 1).each do |idx|
    result += 1 if s[idx] == c
  end
  result
end
=end

# [解答例2]
def solve(input_lines)
  c, s = input_lines.split

  s.count(c).to_s << "\n"
end

puts solve(STDIN.read)

=begin
文字の重複カウント (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/string_count_9
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
1行目の文字が、2行目の文字列の中に何個出現するかをカウントして出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

c
s


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
文字列 s の中に、文字 c が出現する個数を数えて出力してください。

最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件を満たします。

c は1つの文字
1 ≦ (文字列 s の長さ) ≦ 30
c, s は、半角文字で構成された文字列

入力例1
A
abdeeAAbAAAbfde

出力例1
5

入力例2
1
abc123

出力例2
1

入力例3
5
122333444455555

出力例3
5
=end
