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

def hanoi(k, start, work, goal)
  hanoi(k - 1, start, goal, work) if k > 1
  $towers[goal] << $towers[start].pop
  $result << $towers.map { |t| t.empty? ? "-" : t.join(" ") }.join("\n")
  hanoi(k - 1, work, start, goal) if k > 1
end

def solve(input_lines)
  n, t = input_lines.split.map(&:to_i)

  # 現在の杭(塔)の状態
  $towers = [(1..n).to_a.reverse, [], []]
  # 円盤移動の記録
  $result = []
  hanoi(n, 0, 1, 2)

  # t 手目の状態を返す
  $result[t - 1] << "\n"
end

puts solve(STDIN.read)
