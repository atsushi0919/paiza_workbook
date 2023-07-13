# 約数じゃんけん (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__divisor_janken

# 約数列挙
def enumrate_divisors(n)
  res = []
  (1..n ** 0.5).each do |i|
    if n % i == 0
      res << i
      res << n / i if i != n / i
    end
  end
  res.sort
end

# 入力
a, b = gets.split.map(&:to_i)

# 約数の和
div_a = enumrate_divisors(a)[...-1].sum
div_b = enumrate_divisors(b)[...-1].sum

# 約数じゃんけんの判定
res = if div_a > div_b
    "paiza"
  elsif div_a < div_b
    "izapa"
  else
    "draw"
  end
# 結果を出力
puts res

=begin
paiza くんと izapa くんがランダムに出した整数でじゃんけんをします。

このじゃんけんは出した整数の約数の和が大きい方が勝ちです。ただし、約数の和に出した整数は含まないこととします。

例として、paiza くんが 18、izapa くんが 16 を出したとき、
paiza くんの値は 1 + 2 + 3 + 6 + 9 = 21、izapa くんの値は 1 + 2 + 4 + 8 = 15 となるので paiza くんの勝ちとなります。

paiza くんが整数 A、izapa くんが整数 B を出したとき、どちらが勝ったかを教えてください。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 A B が与えられます。


A B

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
整数 A と B の約数の和をそれぞれ計算し、A の約数の和の方が大きければ "paiza"、
B の約数の和の方が大きければ "izapa"、引き分けなら "draw" を一行で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ A, B ≦ 10,000


入力例1
6 9

出力例1
paiza

入力例2
156 456

出力例2
izapa

入力例3
360 401

出力例3
paiza 
=end
