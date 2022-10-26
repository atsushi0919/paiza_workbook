# CSV ファイル 1 (paizaランク B 相当)
# https://paiza.jp/works/mondai/sequence_search_problems_advanced/sequence_search_problems_advanced__strings_step4

INPUT1 = <<~"EOS"
  3 5
  1,4
  2,5
  3,6
EOS
OUTPUT1 = <<~"EOS"
  2,5
  3,6
EOS

INPUT2 = <<~"EOS"
  3 10
  100,10
  200,1
  300,1
EOS
OUTPUT2 = <<~"EOS"
  100,10
EOS

INPUT3 = <<~"EOS"
  1 0
  999,999
EOS
OUTPUT3 = <<~"EOS"
  999,999
EOS

input_lines = STDIN.read.split("\n")
_, x = input_lines.shift.split.map(&:to_i)

results = []
input_lines.each do |line|
  results << line if line.split(",")[-1].to_i >= x
end

puts results
