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
  # 入力受け取り
  n = input_lines.to_i

  # n = 1 -> "0" で初期化
  dp = ["0"]

  # n == 1 なら "0\n" を返す
  return dp.last << "\n" if n == 1

  # n > 1 なら繰り返し処理
  (n - 1).times do
    # 左側は前回の答え
    left = dp[-1]
    # 右側は左側を左右反転して「0」と「1」を入れ替え
    right = ""
    left.reverse.chars.each do |c|
      if c == "0"
        right << "1"
      else
        right << "0"
      end
    end

    # dp末尾に「左側 + "0" + 右側」を追加
    dp << left + "0" + right
  end

  # dp末尾に改行を追加した文字列を返す
  dp.last << "\n"
end

puts solve(STDIN.read())
