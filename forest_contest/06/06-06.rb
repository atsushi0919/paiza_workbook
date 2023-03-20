# 採点 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_006/forest_contest_006__d_scoring

INPUT1 = <<"EOS"
4
correct
correct
incorrect
no_answer
EOS
OUTPUT1 = <<"EOS"
3
EOS

# 解答例1
n = gets.to_i
a = n.times.map { gets.to_i }

score = 0
a.each do |res|
  case res
  when "correct"
    score += 2
  when "incorrect"
    score -= 1
  end
end

puts score

# 解答例2
SCORE_LIST = {
  "correct" => 2,
  "no_answer" => 0,
  "incorrect" => -1,
}
_, *a = $stdin.read.split

puts a.map { |k| SCORE_LIST[k] }.sum
