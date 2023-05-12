# 文字列の重複カウント (paizaランク C 相当)
# https://paiza.jp/works/mondai/prob60/count_string_9

INPUT1 = <<~"EOS"
  AA
  abdeeAAbAAAbfde
EOS
OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  el
  scale
EOS
OUTPUT2 = <<~"EOS"
  0
EOS

INPUT3 = <<~"EOS"
  Ji
  JiJiiJiIjiIJjIJi
EOS
OUTPUT3 = <<~"EOS"
  4
EOS

def solve(input_lines)
  s, t = input_lines.split

  s_len = s.length
  t_len = t.length
  result = 0
  (0..t_len - s_len).each do |idx|
    result += 1 if t[idx..idx + s_len - 1] == s
  end

  # 文字列に変換して末尾に改行を追加する
  result.to_s << "\n"
end

put solve(STDIN.read)

exit

=begin
def solve(input_lines)
  s, t = input_lines.split

  s_len = s.length
  t_len = t.length
  result = 0
  (0..t_len - s_len).each do |idx|
    result += 1 if t[idx..idx + s_len - 1] == s
  end
  result
end
=end

def solve(input_lines)
  s, t = input_lines.split
  t.scan(s).length
end

puts solve(STDIN.read)

=begin
文字列の重複カウント (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/count_string_9
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
1行目で文字列 s、2行目で文字列 t が入力されます。
s が t の中で何回出現するかカウントして出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

s
t


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
出現回数を1行で出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

1 ≦ (文字列 s の長さ) ≦ 10,000
1 ≦ (文字列 t の長さ) ≦ 10,000
文字列 s, t は、半角アルファベットで構成された文字列

入力例1
AA
abdeeAAbAAAbfde

出力例1
3

入力例2
el
scale

出力例2
0

入力例3
Ji
JiJiiJiIjiIJjIJi

出力例3
4
=end
