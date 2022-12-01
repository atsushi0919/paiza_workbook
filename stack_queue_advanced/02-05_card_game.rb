# カードゲーム (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__card_game

INPUT1 = <<~"EOS"
  10 5
  game_start
  draw 1
  draw 2
  draw 1
  exclude 20
EOS
OUTPUT1 = <<~"EOS"
  Lose
EOS

INPUT2 = <<~"EOS"
  7 5
  game_start
  discard 34
  return_from_the_graveyard 34
  draw 20
  draw 14
EOS
OUTPUT2 = <<~"EOS"
  5
EOS

INPUT3 = <<~"EOS"
  22 50
  game_start
  discard 11
  return_from_the_graveyard 8
  exclude 29
  return_from_the_exclusion 13
  return_from_the_exclusion 12
  return_from_the_graveyard 3
  draw 2
  draw 5
  draw 10
  return_from_the_exclusion 3
  return_from_the_exclusion 1
  discard 16
  draw 1
  exclude 1
  return_from_the_graveyard 5
  exclude 3
  return_from_the_graveyard 8
  return_from_the_graveyard 3
  exclude 13
  return_from_the_exclusion 10
  return_from_the_exclusion 4
  discard 4
  return_from_the_graveyard 1
  discard 10
  return_from_the_graveyard 3
  discard 2
  discard 2
  return_from_the_graveyard 11
  return_from_the_exclusion 3
  exclude 10
  return_from_the_exclusion 10
  draw 12
  exclude 2
  return_from_the_exclusion 1
  exclude 1
  return_from_the_graveyard 3
  exclude 3
  return_from_the_exclusion 3
  draw 3
  return_from_the_exclusion 1
  draw 1
  return_from_the_exclusion 1
  discard 1
  return_from_the_graveyard 1
  discard 1
  return_from_the_graveyard 1
  exclude 1
  return_from_the_exclusion 1
  draw 1
EOS

NOC = 40
input_lines = $stdin.read.split("\n")
N, X = input_lines.shift.split.map(&:to_i)
evts = input_lines.shift(X)

stock = Array.new(NOC)     # 山札 queue
stock[N - 1] = "key_card"
graveyard = []             # 墓地 stack
exclud = []                # 除外 stack

evt_cnt = 0
get_key_card = false
until get_key_card || evts.empty?
  ope, n = evts.shift.split
  n = ope == "game_start" ? 5 : n.to_i

  new_cards = []
  case ope
  when "game_start", "draw"
    # stock から dequeue して、 new_cards に push
    n.times { new_cards.push(stock.shift) }
  when "discard"
    # stock から dequeue して、 graveyard に push
    n.times { graveyard.push(stock.shift) }
  when "return_from_the_graveyard"
    # graveyard から pop して、 stock に enqueue
    n.times { stock.push(graveyard.pop) }
  when "exclude"
    # stock から dequeue して、 exclud に push
    n.times { exclud.push(stock.shift) }
  when "return_from_the_exclusion"
    # exclud から pop して、 stock に enqueue
    n.times { stock.push(exclud.pop) }
  end
  evt_cnt += 1
  get_key_card = true if new_cards.include?("key_card")
end

puts get_key_card ? evt_cnt : "Lose"
