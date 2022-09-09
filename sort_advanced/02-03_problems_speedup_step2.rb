# 辞書順 (paizaランク C 相当)
# https://paiza.jp/works/mondai/sort_advanced/sort_advanced__problems_speedup_step2

INPUT1 = <<~"EOS"
  1
EOS
OUTPUT1 = <<~"EOS"
  aaa
EOS

INPUT2 = <<~"EOS"
  5
EOS
OUTPUT2 = <<~"EOS"
  aae
EOS

INPUT3 = <<~"EOS"
  1000
EOS
OUTPUT3 = <<~"EOS"
  bml
EOS

radix = 26
digits = STDIN.read.to_i.to_s(radix).rjust(3, "0").chars
chr_code = [97, 97, 96]
0.upto(2) do |i|
  chr_code[i] += digits[i].to_i(radix)
end

puts chr_code.map(&:chr).join
