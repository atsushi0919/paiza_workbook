# エラトステネスの篩 (paizaランク C 相当)
# https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__eratosthenes

INPUT1 = <<~"EOS"
  2
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

# 1 ≦ N ≦ 1,000,000
# 素数:
# 999_979
# 999_983
N = gets.to_i

# 素数配列初期化
is_prime = Array.new(N + 1, true)
[0, 1].each { |x| is_prime[x] = false }

2.upto(N) do |i|
  next unless is_prime[i]
  k = 2
  while i * k <= N
    is_prime[i * k] = false
    k += 1
  end
end

puts is_prime[N] ? "YES" : "NO"
