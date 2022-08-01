def fib1(n)
  # n = 0 -> return 0
  # n = 1 -> return 1
  return n if n < 2

  # n が 0 か 1 になるまで再起呼び出しを行う
  a = fib1(n - 1)
  b = fib1(n - 2)

  # 返り値を足して返す
  a + b
end

p fib1(4)
# > 3

# 第40項を計算した時に掛かる時間
start = Time.now
p fib1(40)
# > 102334155
puts Time.now - start
# > 14.8706037

def fib2(n)
  unless $memo[n].nil?
    # puts "fib2(#{n}) -> $memo[#{n}]: #{$memo[n]}"
    return $memo[n]
  end

  # 再起呼び出し
  a = fib2(n - 1)
  b = fib2(n - 2)
  c = a + b
  # puts "$memo[#{n}] = #{a} + #{b} = #{c}, return #{c}"

  # 計算結果を$memoに保存して返す
  $memo[n] = c
end

# グローバル変数に答えを記録
$memo = [0, 1]
p fib2(4)
# > 3

start = Time.now
p fib2(40)
# > 102334155
puts Time.now - start
# > 8.61e-05

def fib3(n)
  return [0] if n == 0
  return [0, 1] if n == 1

  ary = fib3(n - 1)
  ary << ary[-1] + ary[-2]
  # p ary

  ary
end

p fib3(4)[-1]
# > 3

start = Time.now
p fib3(40)[-1]
# > 102334155
puts Time.now - start
# > 8.15e-05

def fib4(n)
  dp = [0, 1]
  return dp[..n] if n < 2

  (n - 1).times do
    dp << dp[-1] + dp[-2]
  end
  dp
end

p fib4(4)[-1]
# > 3

start = Time.now
p fib4(40)[-1]
# > 102334155
puts Time.now - start
# > 8.32e-05

def fib5(n)
  return n if n < 2
  a, b = 0, 1

  n.times do
    a, b = b, a + b
  end
  a
end

p fib4(4)
# > 3

start = Time.now
p fib5(40)
# > 102334155
puts Time.now - start
# > 8.85e-05
