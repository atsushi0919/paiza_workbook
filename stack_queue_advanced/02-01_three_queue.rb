# 3 つのキュー (paizaランク C 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__three_queue

INPUT1 = <<~"EOS"
  5
  push 1 5
  push 2 3
  push 3 1
  pop 2
  pop 1
EOS
OUTPUT1 = <<~"EOS"
  1
EOS

INPUT2 = <<~"EOS"
  7
  push 1 1
  push 1 1
  push 1 1
  push 2 2
  push 2 4
  pop 1
  push 3 3
EOS
OUTPUT2 = <<~"EOS"
  1
  1
  2
  4
  3
EOS

NOQ = 3
queues = Array.new(NOQ) { [] }
_, *reqs = $stdin.read.split("\n")

reqs.each do |req|
  ope, *args = req.split
  idx, val = args.map(&:to_i)
  idx -= 1

  case ope
  when "push"
    queues[idx].push(val)
  when "pop"
    queues[idx].shift
  end
end

queues.each do |queue|
  until queue.empty?
    puts queue.shift
  end
end
