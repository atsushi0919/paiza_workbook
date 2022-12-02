# 気温 (paizaランク D 相当)

INPUT1 = <<~"EOS"
  38
EOS
OUTPUT1 = <<~"EOS"
  extremely hot day
EOS

INPUT2 = <<~"EOS"
  32
EOS
OUTPUT2 = <<~"EOS"
  hot summer day
EOS

INPUT3 = <<~"EOS"
  -1
EOS
OUTPUT3 = <<~"EOS"
  ice day
EOS

x = gets.to_i

res = if x >= 35
    "extremely hot day"
  elsif x >= 30
    "hot summer day"
  elsif x >= 25
    "summer day"
  elsif x < 0
    "ice day"
  else
    "normal day"
  end

puts res

=begin
 下記の問題をプログラミングしてみよう！
最高気温が35度以上の日を猛暑日、30度以上の日を真夏日、25度以上の日を夏日、0度未満の日を真冬日といいます。
最高気温が与えられるので、どの日に当たるかを判定してください。

▼　下記解答欄にコードを記入してみよう

入力される値
x


・ 1 行目に、最高気温 x が入力されます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。
期待する出力
猛暑日なら、"extremely hot day"、真夏日なら、"hot summer day"、夏日なら、"summer day"、真冬日なら、"ice day"、それ以外は"normal day"と出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ -20 ≦ x ≦ 40


=end
