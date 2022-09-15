# Q3: リング型のトークンパッシング (paizaランク B 相当)
# https://paiza.jp/works/mondai/vantan_2021/vantan_2021__q3_token_passing

INPUT1 = <<~"EOS"
  4 2
  1
  2
  3
  4
  2
  1
EOS
OUTPUT1 = <<~"EOS"
  10
EOS

INPUT2 = <<~"EOS"
  5 3
  10
  20
  30
  40
  50
  4
  3
  3
EOS
OUTPUT2 = <<~"EOS"
  330
EOS

input_lines = STDIN.read.split("\n")
n, k = input_lines.shift.split.map(&:to_i)
t = input_lines.shift(n).map(&:to_i)
d = input_lines.shift(k).map(&:to_i)

# 累積和を計算しておく
s = [0]
t.each { |t_i| s << s[-1] + t_i }

now = 0
total_time = 0
d.each do |d_i|
  d_i -= 1
  if now < d_i
    # now から d_i までの時間を加える
    total_time += s[d_i] - s[now]
  else
    # now から n までの時間と n から d_i までの時間を加える
    total_time += s[n] - s[now] + s[d_i] - s[0]
  end
  now = d_i
end

puts total_time
