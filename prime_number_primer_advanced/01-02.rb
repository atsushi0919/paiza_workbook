# 素数大好き paiza くん 2 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer_advanced/prime_number_primer_advanced__range_show

def prime?(n)
  # 1 は素数じゃない
  return false if n == 1
  # 2 以上なら素数かを調べる
  2.upto(n ** 0.5) { |i| return false if n % i == 0 }
  true
end

# 入力
a, b = gets.split.map(&:to_i)

# a 以上 b 以下の素数をリストアップする
prime_numbers = (a..b).select { |n| prime?(n) }

# 出力
puts prime_numbers.empty? ? "Nothing" : prime_numbers

=begin
paiza 君は素数が大好きですが、どれが素数なのか判定することができません。

整数 A, B が与えられるので、paiza 君の代わりに A 以上 B 以下の素数を全て列挙してください。

なお、「整数 N が素数である」とは「N が 1 でない、かつ N の約数が 1 と N のみしか存在しない」ことをいいます。

▼　下記解答欄にコードを記入してみよう

入力される値
・ 1 行目に整数 A, B が与えられます。


A B

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
整数 A 以上 B 以下の各整数について素数かどうか判定し、A 以上 B 以下の素数を改行区切りで出力してください。

また、素数は昇順で出力してください。

素数がない場合 "Nothing" を一行で出力してください。

末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ A ≦ B ≦ 1,000

入力例1
1 10

出力例1
2
3
5
7

入力例2
10 100

出力例2
11
13
17
19
23
29
31
37
41
43
47
53
59
61
67
71
73
79
83
89
97

入力例3
8 10

出力例3
Nothing
=end
