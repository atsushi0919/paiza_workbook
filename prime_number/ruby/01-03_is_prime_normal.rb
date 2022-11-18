# 大きな数の素数判定 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__is_prime_normal

INPUT1 = <<~"EOS"
  15
EOS
OUTPUT1 = <<~"EOS"
  NO
EOS
INPUT2 = <<~"EOS"
  2147483647
EOS
OUTPUT2 = <<~"EOS"
  YES
EOS

# 1 ≦ N ≦ 1_000_000_000_000
# 素数:
# 999_999_999_961
# 999_999_999_989
N = gets.to_i

is_prime = true
if N == 1
  # 1 は素数じゃない
  is_prime = false
else
  # 2 から √N までで割り切れたら素数じゃない
  2.upto(N ** 0.5).each do |d|
    if N % d == 0
      is_prime = false
      break
    end
  end
end

puts is_prime ? "YES" : "NO"
