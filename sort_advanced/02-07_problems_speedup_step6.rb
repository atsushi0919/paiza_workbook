# スケジューリング (paizaランク B 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step6

INPUT1 = <<~"EOS"
  3
  1 4
  4 7
  7 10
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  3
  1 8
  3 5
  6 9
EOS
OUTPUT2 = <<~"EOS"
  2
EOS

input_lines = STDIN.read.split("\n")
a = input_lines[1..].map { |line| line.split.map(&:to_i) }
a.sort_by! { |x| x[1] }

# 現在時刻, 回数
now = 0
count = 0
while not a.empty?
  # l: 開始日, r: 終了日
  l, r = a.shift
  if now < l
    now = r
    count += 1
  end
end

puts count
