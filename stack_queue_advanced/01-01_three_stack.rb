# 3 つのスタック (paizaランク C 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__three_stack

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
  4
  2
  3
EOS

NOS = 3
stacks = Array.new(NOS) { [] }
_, *Q = $stdin.read.split("\n")

Q.each do |req|
  ope, *args = req.split
  i, val = args.map(&:to_i)
  i -= 1

  case ope
  when "push"
    stacks[i].push(val)
  when "pop"
    stacks[i].pop
  end
end

stacks.each do |stack|
  until stack.empty?
    puts stack.pop
  end
end
