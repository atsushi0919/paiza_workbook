# 【いもす法の練習問題】練習問題 その 2 (paizaランク B 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__imos_practice_step2

INPUT1 = <<~"EOS"
  2 10
  1 3 5
  2 5 4
EOS

OUTPUT1 = <<~"EOS"
  Yes
EOS

INPUT2 = <<~"EOS"
  2 10
  1 3 5
  2 5 5
EOS

OUTPUT2 = <<~"EOS"
  No
EOS

def solve(input_str)
  input_lines = input_str.split("\n")
  # q: 予約数, m: 人数制限
  q, m = input_lines.shift.split.map(&:to_i)
  # end_time: 最後の退場時刻
  end_time = -Float::INFINITY
  a = input_lines.map do |e|
    s, t, c = e.split.map(&:to_i)
    end_time = [end_time, t].max
    [s, t, c]
  end

  # いもす
  imos = Array.new(end_time + 1, 0)
  # s: 入場時刻, t: 退場時刻, c: 人数
  a.each do |s, t, c|
    imos[s - 1] = imos[s - 1] + c
    imos[t] = imos[t] - c
  end

  # 累積和
  is_ok = true
  s = [0]
  imos[...-1].each do |e|
    s << s[-1] + e
    if s[-1] >= m
      is_ok = false
      break
    end
  end
  is_ok ? "Yes" : "No"
end

puts solve(STDIN.read)
