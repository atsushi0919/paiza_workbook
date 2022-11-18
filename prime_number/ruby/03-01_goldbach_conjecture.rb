# ゴールドバッハ予想 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__goldbach_conjecture

入力例1 = <<~"EOS"
  4
EOS
出力例1 = <<~"EOS"
  2
  2
EOS

入力例2 = <<~"EOS"
  108
EOS
出力例2 = <<~"EOS"
  47
  61
EOS

# nが素数か判定する
def isPrime(n)
  return false if n == 0 || n == 1  # 0も1も素数ではない

  # (2...n).each do |i| # 2, 3, 4, ..., n-1
  #   return false if n % i == 0      # nがiで割り切れる
  # end

  # 19: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, ...
  # 16: 1, 2, 4, 8, 16
  # nの平方根まで順に割れるかどうか調べる

  i = 2
  while i * i <= n
    return false if n % i == 0
    i += 1
  end

  true
end

# puts isPrime(2) # => true

n = gets.to_i

# 60 = 1 + 59
# 60 = 2 + 58
# 60 = 3 + 57
# ...
# 60 = 58 + 2
# 60 = 59 + 1
#
# 60 = i + j

prime1 = 0
prime2 = 0

(1...n).each do |i|
  j = n - i
  if isPrime(i) && isPrime(j)
    if i * j > prime1 * prime2
      prime1 = i
      prime2 = j
    end
  end
end

puts prime1
puts prime2

=begin
for i in range(1, n):
    j = n - i
    if isPrime(i) and isPrime(j):
        
            prime1 = i
            prime2 = j

print(prime1)
print(prime2)

# 47 x 61 = 2867
# 103 x 5 = 515
# 49 x 59 = 2891
=end

=begin
素数に関連した数学の有名な未解決問題としてゴールドバッハ予想があります。その内容は次の通りです。
「全ての 3 よりも大きな偶数は 2 つの素数の和として表すことができる。」
全ての 3 よりも大きな偶数に対応する 2 つの素数が存在するかどうかはコンピュータを持ってしても確かめることができませんが、
ある程度の大きさの数までならコンピュータで対応する 2 つの素数を求めることができます。

実際に 4 × 10^18 まではゴールドバッハ予想が成立することは証明されています。
そこで、10^5 以下の偶数 N が与えられるので、 N を 2 つの素数の和で表し、出力してください。
ただし、答えが複数個ある場合は、それらのうち、積が最も大きくなるような 2 つの素数を出力してください。
（答えは 1 通りになることが保証されます。）

▼　下記解答欄にコードを記入してみよう

入力される値
N


・ 1 行で整数 N が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
足して N となる 2 つの素数のうち、積が最大であるものを小さい素数から順に改行区切りで 2 行で出力してください。
出力の末尾には改行を入れてください。

条件
・ 4 ≦ N ≦ 100,000
・ N は偶数である

入力例1
4

出力例1
2
2

入力例2
108

出力例2
47
61

# nが素数か判定する
def isPrime(n):
    if n == 0 or n == 1: # 0も1も素数ではない
        return False

    # for i in range(2, n): # 2, 3, 4, ..., n-1
    #     if n % i == 0: # nがiで割り切れる
    #         return False
    # 19: 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, ...
    # 16: 1, 2, 4, 8, 16
    # nの平方根まで順に割れるかどうか調べる
    
    i = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += 1

    return True

# print(isPrime(2)) # => True

n = int(input())

# 60 = 1 + 59
# 60 = 2 + 58
# 60 = 3 + 57
# ...
# 60 = 58 + 2
# 60 = 59 + 1
# 
# 60 = i + j

prime1 = 0
prime2 = 0

for i in range(1, n):
    j = n - i
    if isPrime(i) and isPrime(j):
        if i * j > prime1 * prime2:
            prime1 = i
            prime2 = j

print(prime1)
print(prime2)

# 47 x 61 = 2867
# 103 x 5 = 515
# 49 x 59 = 2891
=end
