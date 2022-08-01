# 山折り谷折り (paizaランク A 相当)
# https://paiza.jp/works/mondai/real_event/origami

INPUT1 = <<~"EOS"
  1
EOS
OUTPUT1 = <<~"EOS"
  0
EOS

INPUT2 = <<~"EOS"
  2
EOS
OUTPUT2 = <<~"EOS"
  001
EOS

def solve(input_lines)
  n = input_lines.to_i

  # n = 1 -> "0" で初期化
  res = "0"
  (n - 1).times do
    l = res.length
    # res の 末尾に 0 と resを左右反転してビット反転(~) したものを連結する
    res <<= "0#{(~res.reverse.to_i(2) + (1 << l)).to_s(2).rjust(l, "0")}"
  end

  # 結果 res に改行を追加して返す
  res << "\n"
end

puts solve(STDIN.read())
