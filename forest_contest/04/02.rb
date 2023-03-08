# じゃんけん (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_004/forest_contest_004__rps_easy

INPUT1 = <<"EOS"
R
EOS

OUTPUT1 = <<"EOS"
P
EOS

# 解答例1-1
h = gets.chomp

res = if h == "R"
    "P"
  elsif h == "P"
    "S"
  elsif h == "S"
    "R"
  end

puts res

# 解答例1-2
h = gets.chomp

res = case h
  when "R"
    "P"
  when "P"
    "S"
  when "S"
    "R"
  end

puts res

# 解答例2
RPS = %w(R P S)  # RPS = ["R", "P", "S"] と同じ

puts RPS[(RPS.index(gets.chomp) + 1) % RPS.length]

=begin

問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
あなたは絶対に負けないじゃんけんプログラムを作ろうとしています。

じゃんけんをする相手が出す手が与えられるので、相手に勝つ手を求めてください。
ただし、プログラム上ではグー (Rock) を R、パー (Paper) を P、チョキ (Scissors) を S で表すことにします。

▼　下記解答欄にコードを記入してみよう

入力される値
h

・ 1 行目に、相手が出す手 h が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
相手の手 h に勝つ手を求め、1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ h は R、P、S のいずれか

入力例1
R

出力例1
P
=end
