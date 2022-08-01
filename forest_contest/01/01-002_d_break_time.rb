# バイトの休憩時間 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_001/forest_contest_001__d_break_time

INPUT1 = <<~"EOS"
  9
EOS
OUTPUT1 = <<~"EOS"
  60 min
EOS
INPUT2 = <<~"EOS"
  6
EOS
OUTPUT2 = <<~"EOS"
  no break
EOS

def solve(input_str)
  # 入力
  h = input_str.to_i

  # 休憩時間
  rest_time = if h > 8
      60
    elsif h > 6
      45
    else
      "no break"
    end

  # 休憩時間の表示変換
  if rest_time.kind_of?(Integer)
    rest_time = "#{rest_time} min"
  end

  # 休憩時間を返す
  rest_time
end

puts solve(STDIN.read)
