# 積読 (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__tundoku

INPUT1 = <<~"EOS"
  3
  buy_book 10
  buy_book 15
  read 10
EOS
OUTPUT1 = <<~"EOS"
  2
  15
EOS

INPUT2 = <<~"EOS"
  5
  buy_book 100
  buy_book 100
  buy_book 200
  read 240
  read 80
EOS
OUTPUT2 = <<~"EOS"
  1
  80
EOS

_, *Q = $stdin.read.split("\n")

stack = []
Q.each do |req|
  ope, page = req.split
  page = page.to_i

  case ope
  when "buy_book"
    stack.push(page)
  when "read"
    while page > 0
      unread = stack.pop
      if unread > page
        unread -= page
        page = 0
        stack.push(unread)
      else
        page -= unread
      end
    end
  end
end

puts [stack.length, stack.sum].join("\n")
