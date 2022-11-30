# レンタルビデオ店 (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__rental_video

INPUT1 = <<~"EOS"
  3
  1
  2
  3
  3
  return 4
  rent
  rent
EOS
OUTPUT1 = <<~"EOS"
  2
  1
EOS

INPUT2 = <<~"EOS"
  1
  6
  4
  return 5
  return 4
  return 3
  return 2
EOS

OUTPUT2 = <<~"EOS"
  2
  3
  4
  5
  6
EOS

input_lines = $stdin.read.split("\n")
N = input_lines.shift.to_i
X = input_lines.shift(N).map(&:to_i)
K = input_lines.shift.to_i
Q = input_lines.shift(K)

stack = X
Q.each do |req|
  ope, bid = req.split
  bid = bid.to_i

  case ope
  when "return"
    stack.push(bid)
  when "rent"
    stack.pop
  end
end

until stack.empty?
  puts stack.pop
end

=begin
レンタルビデオ店を経営している paiza 君は、スタックを利用することで、
レンタルビデオの貸し借りをした後の棚の状態を管理することができると考えました。

レンタルビデオ店では、貸出時は棚の先頭のビデオを取り出し、返却時は返されたビデオを棚の先頭に置きます。
paiza 君は店のある 1 つの棚について棚の状態を管理してみることにしました。
開店時に棚にあるビデオの管理番号と、営業中の貸出・返却の内容が与えられるので、閉店時に棚に残っているビデオの管理番号を求めましょう。
貸出・返却の内容は次の形式で与えられます。

・rent
棚の先頭のビデオを貸し出す。

・return X
管理番号 X のビデオが返却される。

▼　下記解答欄にコードを記入してみよう

入力される値
N
X_1
...
X_N
K
Q_1
...
Q_K


・1 行目では開店時に棚にあるビデオの個数 N が与えられます。
・2 行目からの N 行では、開店時に棚にあるビデオの管理番号が末尾から順に与えられます。
・N + 2 行目では、与えられる貸出・返却の回数 K が与えられます。
・N + 3 行目からの K 行では、貸出・返却の内容が時系列順に与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・閉店時に棚に残っているビデオの管理番号を、棚の先頭から順に改行区切りで出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ N ≦ 10,000
・1 ≦ X_i ≦ 100,000(1 ≦ i ≦ N)
・1 ≦ K ≦ 10000
・棚が空の状態で rent は与えられないことが保証されている
・Q_i は次のいずれかの形式
「rent」
「return X(1 ≦ X ≦ 100,000)」
・管理番号は重複することがないことが保証されている。

入力例1
3
1
2
3
3
return 4
rent
rent

出力例1
2
1

入力例2
1
6
4
return 5
return 4
return 3
return 2

出力例2
2
3
4
5
6
=end
