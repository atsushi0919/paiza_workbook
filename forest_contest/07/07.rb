# 三冠王 (paizaランク B 相当)

INPUT1 = <<~"EOS"
  3
  0.318 134 56
  0.314 20 1
  0.252 82 30
EOS
OUTPUT1 = <<~"EOS"
  Triple
EOS

INPUT2 = <<~"EOS"
  3
  0.276 134 56
  0.314 20 1
  0.252 82 30
EOS
OUTPUT2 = <<~"EOS"
  Double
EOS

INPUT3 = <<~"EOS"
  3
  0.276 92 32
  0.314 20 1
  0.252 82 34
EOS
OUTPUT3 = <<~"EOS"
  Nobody
EOS

n, *q = $stdin.read.split("\n")
n = n.to_i

recs = 3.times.map { Hash.new { [] } }
q.each_with_index do |rec, i|
  b_i, r_i, h_i = rec.split
  recs[0][b_i.to_f] <<= i
  recs[1][r_i.to_i] <<= i
  recs[2][h_i.to_i] <<= i
end

p_results = Array.new(n, 0)
recs.map { |rec| rec.sort.last }.each do |rec|
  rec.last.each do |p_i|
    p_results[p_i] += 1
  end
end

title = case p_results.max
  when 3
    "Triple"
  when 2
    "Double"
  else
    "Nobody"
  end

puts title
