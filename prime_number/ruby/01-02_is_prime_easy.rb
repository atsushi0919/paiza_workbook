# 素数判定 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__is_prime_easy

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

N = gets.to_i

is_prime = true
if N == 1
  # 1 は素数じゃない
  is_prime = false
else
  # 2 から N-1 までで割り切れたら素数じゃない
  2.upto(N - 1).each do |d|
    if N % d == 0
      is_prime = false
      break
    end
  end
end

puts is_prime ? "YES" : "NO"
