# ハノイの塔 (paizaランク A 相当)
# https://paiza.jp/works/mondai/real_event/hanoi

INPUT1 = <<~"EOS"
  3 4
EOS
OUTPUT1 = <<~"EOS"
  -
  2 1
  3
EOS

INPUT2 = <<~"EOS"
  4 6
EOS
OUTPUT2 = <<~"EOS"
  4 1
  3 2
  -
EOS

def solve(input_lines)
  n, t = input_lines.split.map(&:to_i)

  pattern = [[2, 1, 0], [1, 2, 0]]
  towers = Array.new(3) { [] }
  (1..n).reverse_each.with_index do |disk, i|
    k = 2 ** (disk - 1)
    if t < k
      towers[0] << disk
    elsif t >= 2 ** n - k
      towers[2] << disk
    else
      towers[pattern[i % 2][((t - k) / 2 ** disk) % 3]] << disk
    end
  end

  towers.map do |disks|
    disks.empty? ? "-" : disks.join(" ")
  end
end

puts solve(STDIN.read)
