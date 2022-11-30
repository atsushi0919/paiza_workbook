# レンタルビデオ店 (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__rental_video

INPUT1 = <<~"EOS"
  3
  1
  2
  3
  3
  return 4
  rent
  rent
EOS
OUTPUT1 = <<~"EOS"
  2
  1
EOS

INPUT2 = <<~"EOS"
  1
  6
  4
  return 5
  return 4
  return 3
  return 2
EOS

OUTPUT2 = <<~"EOS"
  2
  3
  4
  5
  6
EOS

input_lines = $stdin.read.split("\n")
N = input_lines.shift.to_i
X = input_lines.shift(N).map(&:to_i)
K = input_lines.shift.to_i
Q = input_lines.shift(K)

stack = X
Q.each do |req|
  ope, bid = req.split
  bid = bid.to_i

  case ope
  when "return"
    stack.push(bid)
  when "rent"
    stack.pop
  end
end

until stack.empty?
  puts stack.pop
end
