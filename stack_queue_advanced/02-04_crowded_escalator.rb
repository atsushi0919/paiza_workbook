# 満員エスカレーター (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__crowded_escalator

INPUT1 = <<~"EOS"
  2 100
  ride 3 50 40 50
  get_off 1
EOS
OUTPUT1 = <<~"EOS"
  1
  40
EOS

INPUT2 = <<~"EOS"
  4 123
  ride 1 130
  ride 2 10 100
  get_off 1
  ride 1 150
EOS
OUTPUT2 = <<~"EOS"
  1
  100
EOS

input_lines = $stdin.read.split("\n")
N, X = input_lines.shift.split.map(&:to_i)
Q = input_lines.shift(N)

gwt = 0
queue = []
Q.each do |req|
  ope, *params = req.split
  n, *wts = params.map(&:to_i)

  case ope
  when "ride"
    wts.each do |wt|
      if gwt + wt <= X
        gwt += wt
        queue.push(wt)
        # 問題文通りに実装すると 13 点
        # else
        #   break
      end
    end
  when "get_off"
    n.times { gwt -= queue.shift }
  end
end

puts [queue.length, gwt].join("\n")
