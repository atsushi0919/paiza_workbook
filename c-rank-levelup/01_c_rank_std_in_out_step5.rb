# 半角スペース区切りでの出力 (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_std_in_out_step5

INPUT1 = <<~"EOS"
  2
EOS
OUTPUT1 = <<~"EOS"
  paiza paiza
EOS

INPUT2 = <<~"EOS"
  3
EOS
OUTPUT2 = <<~"EOS"
  paiza paiza paiza
EOS

result = ""
(1..gets.to_i).each do |count|
  result << "paiza"
  break if count == n
  result << " "
end
puts result

puts Array.new(gets.to_i, "paiza").join(" ")
