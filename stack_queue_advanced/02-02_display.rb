# 品出し (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__display

INPUT1 = <<~"EOS"
  3
  add 264
  add 742
  add 737
EOS
OUTPUT1 = <<~"EOS"
  264
  742
  737
EOS

INPUT2 = <<~"EOS"
  5
  add 374
  add 3742
  add 938
  buy 2
  add 737
EOS
OUTPUT2 = <<~"EOS"
  938
  737
EOS

_, *reqs = $stdin.read.split("\n")

queue = []
reqs.each do |req|
  ope, arg = req.split

  case ope
  when "add"
    queue.push(arg)
  when "buy"
    qty = arg.to_i
    queue.shift(qty)
  end
end

until queue.empty?
  puts queue.shift
end
