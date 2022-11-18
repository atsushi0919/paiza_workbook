# フェルマーテスト (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__fermat_test

INPUT1 = <<~"EOS"
  3
EOS
OUTPUT1 = <<~"EOS"
  YES
EOS
INPUT2 = <<~"EOS"
  837
EOS
OUTPUT2 = <<~"EOS"
  NO
EOS

# 3 ≦ N ≦ 1,000,000
# 素数:
# 999_979
# 999_983
N = gets.to_i

# a を 2 から N-1 までの数からランダムに選ぶ
a = (2..N - 1).to_a.sample

# N が a で割り切れる場合は N は素数でない
is_prime = true
if N % a == 0
  is_prime = false
else
  fermat = 1
  (N - 1).times do
    fermat *= a
    fermat %= N
  end
  # a^(N-1) を N で割ったあまりが 1 でない場合は素数でない
  p ["amari", fermat]
  is_prime = false if fermat != 1
end

puts is_prime ? "YES" : "NO"
