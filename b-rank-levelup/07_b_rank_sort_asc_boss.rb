# 字と整数の組のソート (paizaランク C 相当)
# https://paiza.jp/works/mondai/prob60/sort_asc_9

INPUT1 = <<~"EOS"
  2
  A 1
  B 2
EOS
OUTPUT1 = <<~"EOS"
  A
  B
EOS

INPUT2 = <<~"EOS"
  3
  G 0
  S 3
  E -2
EOS
OUTPUT2 = <<~"EOS"
  E
  G
  S
EOS

INPUT3 = <<~"EOS"
  5
  H -2
  R 0
  W -5
  A -1
  E -20
EOS
OUTPUT3 = <<~"EOS"
  E
  W
  H
  A
  R
EOS

=begin
def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i

  # 文字と整数のペアを配列に格納する
  ary = input_lines.map do |line|
    s, d = line.split
    [s, d.to_i]
  end

  # 2番目の要素（整数）で昇順に並び替えた配列を生成する
  sorted_ary = ary.sort_by { |x| x[1] }

  # 文字列に変換して末尾に改行を追加する
  sorted_ary.map { |x| x[0] }.join("\n") << "\n"
end

puts solve(STDIN.read)
=end

def solve(input_lines)
  # 入力データ受け取り
  n, *lines = input_lines.split("\n")

  # 文字と整数のペアを配列に格納する
  ary = lines.map do |line|
    s, d = line.split
    [s, d.to_i]
  end

  # 整数で昇順ソートしてハッシュに変換する
  sorted_hash = ary.sort_by { |x| x[1] }.to_h

  # ハッシュのキーの配列を改行区切りで出力する
  sorted_hash.keys.join("\n") << "\n"
end

puts solve(STDIN.read)

=begin
字と整数の組のソート (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/prob60/sort_asc_9
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
1行目に行数を表す整数 n、続く n 行の各行で「文字」と「整数」の組が空白区切りで入力されます。
n 個の組を、「整数」の値で昇順に並べ変え、「文字」を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

n
S_1 D_1
S_2 D_2
...
S_i D_i
...
S_n D_n

S_i は「文字」で、D_i は「整数」です。
入力される文字 S_i は、同じ文字が複数入力されることはなく、整数 D_i も同様です。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
n 個の組を、「整数」の値で昇順に並べ変え、「文字列」を1行ずつ出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ n ≦ 100
・-10,000 ≦ D_i ≦ 10,000
・S_iは半角英文字1文字
・iとjが異なるなら、D_iとD_jは異なる
・iとjが異なるなら、S_iとS_jは異なる

入力例1
2
A 1
B 2

出力例1
A
B

入力例2
3
G 0
S 3
E -2

出力例2
E
G
S

入力例3
5
H -2
R 0
W -5
A -1
E -20

出力例3
E
W
H
A
R
=end
