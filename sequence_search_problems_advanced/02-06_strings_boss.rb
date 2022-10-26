# CSV ファイル 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__strings_boss

INPUT1 = <<~"EOS"
  4 3 3 9
  1,4,7
  2,5,8
  3,6,9
  10,11,12
EOS
OUTPUT1 = <<~"EOS"
  3,6,9
  10,11,12
EOS

INPUT2 = <<~"EOS"
  3 2 1 10
  100,10
  200,1
  300,1
EOS
OUTPUT2 = <<~"EOS"
  100,10
  200,1
  300,1
EOS

INPUT3 = <<~"EOS"
  1 2 2 0
  999,999
EOS
OUTPUT3 = <<~"EOS"
  999,999
EOS

input_lines = STDIN.read.split("\n")
_, _, k, x = input_lines.shift.split.map(&:to_i)

results = []
input_lines.each do |line|
  results << line if line.split(",")[k - 1].to_i >= x
end

puts results
