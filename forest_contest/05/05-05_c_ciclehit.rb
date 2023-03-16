# サイクルヒット (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__c_ciclehit

INPUT1 = <<"EOS"
4
3
2
0
1
EOS

OUTPUT1 = <<"EOS"
Yes
EOS

# 解答例1-1
n = 5

single_hit = false
two_base_hit = false
three_base_hit = false
home_run = false
n.times do
  m_i = gets.to_i
  if m_i == 1
    single_hit = true
  elsif m_i == 2
    two_base_hit = true
  elsif m_i == 3
    three_base_hit = true
  elsif m_i == 4
    home_run = true
  end
end

if single_hit && two_base_hit && three_base_hit && home_run
  puts "Yes"
else
  puts "No"
end

# 解答例1-2
m = $stdin.read.split.map(&:to_i)

# 0: 単打, 1: 二塁打, 2: 三塁打, 3: 本塁打
ciclehit = Array.new(4, false)  # ciclehit = [false] * 4 でも OK

m.each { |res| ciclehit[res - 1] = true if res > 0 }

puts ciclehit.all? ? "Yes" : "No"

# 解答例2-1
m = $stdin.read.split

results = Hash.new(0)
m.each { |res| results[res] += 1 if res != "0" }

puts results.length == 4 ? "Yes" : "No"


# 解答例2-2
results = $stdin.read.split.select { |x| x != "0" }.tally

puts results.length == 4 ? "Yes" : "No"
