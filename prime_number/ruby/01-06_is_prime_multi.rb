# 素数大学 (paizaランク B 相当)
# https://paiza.jp/works/mondai/prime_number_primer/prime_number_primer__is_prime_multi

INPUT1 = <<~"EOS"
  5
  5
  6
  7
  8
  9
EOS
OUTPUT1 = <<~"EOS"
  pass
  failure
  pass
  failure
  failure
EOS
INPUT2 = <<~"EOS"
  15
  1066
  9116
  4350
  8707
  99614
  48979
  51412
  26894
  11779
  3082
  96436
  43526
  45530
  6694
  71442
EOS
OUTPUT2 = <<~"EOS"
  failure
  failure
  failure
  pass
  failure
  failure
  failure
  failure
  pass
  failure
  failure
  failure
  failure
  failure
  failure
EOS

# 1 ≦ N ≦ 380,000
# 1 ≦ A_i ≦ 6,000,000 (1 ≦ i ≦ N)
N, *A = STDIN.read.split.map(&:to_i)
# N = 380_000
# A = N.times.map { rand(1..6_000_000) }

ma = A.max
# 素数配列初期化
is_prime = Array.new(ma + 1, true)
[0, 1].each { |x| is_prime[x] = false }

2.upto(ma) do |i|
  next unless is_prime[i]
  k = 2
  while i * k <= ma
    is_prime[i * k] = false
    k += 1
  end
end

puts A.map { |x| is_prime[x] ? "pass" : "failure" }.join("\n")
