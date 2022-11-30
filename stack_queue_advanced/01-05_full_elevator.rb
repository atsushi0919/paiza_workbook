# 満員エレベーター (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__full_elevator

INPUT1 = <<~"EOS"
  2 100
  ride 3 50 50 50
  get_off 1
EOS
OUTPUT1 = <<~"EOS"
  1
  50
EOS

INPUT2 = <<~"EOS"
  4 123
  ride 1 130
  ride 2 10 100
  get_off 2
  ride 1 150
EOS
OUTPUT2 = <<~"EOS"
  0
  0
EOS

input_lines = $stdin.read.split("\n")
N, X = input_lines.shift.split.map(&:to_i)
Q = input_lines.shift(N)

gwt = 0
stack = []
Q.each do |req|
  ope, *params = req.split
  n, *wts = params.map(&:to_i)

  case ope
  when "ride"
    wts.each do |wt|
      if gwt + wt <= X
        gwt += wt
        stack.push(wt)
        # 問題文通りに実装すると 16 点
        # else
        #   break
      end
    end
  when "get_off"
    n.times { gwt -= stack.pop }
  end
end

puts [stack.length, gwt].join("\n")
