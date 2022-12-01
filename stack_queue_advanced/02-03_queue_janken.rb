# キューじゃんけん (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__queue_janken

INPUT1 = <<~"EOS"
  3 5
  P R
  S S
  R P
  push push
  push push
  push push
  discard push
  push discard
EOS
OUTPUT1 = <<~"EOS"
  paiza
EOS

INPUT2 = <<~"EOS"
  1 6
  R R
  push push
  push push
  push push
  push push
  push push
  push push
EOS
OUTPUT2 = <<~"EOS"
  draw
EOS

def janken(p0, p1)
  return -1 if p0 == p1
  cd = { "R" => 0, "S" => 1, "P" => 2 }
  ((cd[p0] - cd[p1]) % 3) % 2
end

Player = Struct.new(:name, :block, :win_cnt)

input_lines = $stdin.read.split("\n")
N, K = input_lines.shift.split.map(&:to_i)
Q = input_lines.shift(N).map(&:split)
C = input_lines.shift(K).map(&:split)

queues = Q.transpose
players = [Player.new("paiza", queues[0], 0),
           Player.new("kyoko", queues[1], 0)]
K.times do
  opes = C.shift
  jankens = players.map { |pl| pl.block.shift }
  winer = janken(*jankens)
  players[winer].win_cnt += 1 if winer != -1

  opes.each_with_index do |ope, i|
    players[i].block.push(jankens[i]) if ope == "push"
  end
end

res = if players[0].win_cnt > players[1].win_cnt
    players[0].name
  elsif players[0].win_cnt < players[1].win_cnt
    players[1].name
  else
    "draw"
  end

puts res
