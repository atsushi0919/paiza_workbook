# CD (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_005/forest_contest_005__d_cd

INPUT1 = <<"EOS"
15
1 7
5 22
5 23
5 4
4 30
3 58
3 55
4 17
3 30
5 0
3 53
3 38
5 25
4 14
7 16
EOS

OUTPUT1 = <<"EOS"
Yes
EOS

# 解答例1-1
MAX_RECORDING_SEC = 60 * 74  # 4440 秒
n = gets.to_i

total_sec = 0
n.times do
  m, s = gets.split.map(&:to_i)
  total_sec += 60 * m + s
end

if total_sec <= MAX_RECORDING_SEC
  puts "Yes"
else
  puts "No"
end

# 解答例1-2
MAX_RECORDING_SEC = 60 * 74  # 4440 秒
_, *songs = $stdin.read.split("\n").map { |r| r.split.map(&:to_i) }

total_sec = songs.map { |m, s| 60 * m + s }.sum

puts total_sec <= MAX_RECORDING_SEC ? "Yes" : "No"

# 解答例2
MAX_RECORDING_SEC = 60 * 74  # 4440 秒
_, *songs = $stdin.read.split("\n").map { |r| r.split.map(&:to_i) }

m, s = songs.transpose.map { |a| a.inject(:+) }
total_sec = 60 * m + s

puts total_sec <= MAX_RECORDING_SEC ? "Yes" : "No"
