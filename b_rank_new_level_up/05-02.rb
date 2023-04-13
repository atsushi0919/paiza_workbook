# 【文字列 2】super long int (paizaランク C 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__super_long_int

INPUT1 = <<"EOS"
11111111111111111111111111111111
EOS
OUTPUT1 = <<"EOS"
44444444
EOS

INPUT2 = <<"EOS"
36585594857520029384829183475638
EOS
OUTPUT2 = <<"EOS"
299661525
EOS

# 区切る桁数
DIGIT = 8
# 入力 (x は 32 桁の整数であり 1 桁目の数字が 0 でない)
x = gets.chomp

# ハッシュ計算
hash = 0.upto(3).map { |i| x[DIGIT * i..DIGIT * i + DIGIT - 1].to_i }.sum

# 出力
puts hash

=begin
整数型が用意されている言語では、int や long int といった型を用いて数値を保持することが多いです。
しかし、これらの型は扱える値の上限が 10^10 程度にされていることが多いです。

そこで paiza 君は新たに 32 桁の数字を受け取ることができる型 super long int を定義することにしました。
また super long int 型の値 X から int 型のハッシュ値を求める関数 hash(X) を次の通り定義しました。
hash(X) = X を 8 桁ずつに区切って得られる 4 つの 8 桁の数字の和

super long int 型の値 X が与えられるので、hash(X) の値を求めてください。

▼　下記解答欄にコードを記入してみよう

入力される値
X


X は 32 桁の整数であり、1 桁目の数字が 0 でないことが保証されています。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
hash(X)

入力された X に対するハッシュ値 hash(X) を出力してください。
条件
・X は 32 桁の整数である（X の 1 桁目は 0 でない）

入力例1
11111111111111111111111111111111

出力例1
44444444

入力例2
36585594857520029384829183475638

出力例2
299661525
=end
