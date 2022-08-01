# 【いもす法の練習問題】練習問題 その 3 (paizaランク B 相当)
# https://paiza.jp/works/mondai/prefix_sum_problems_advanced/prefix_sum_problems_advanced__imos_practice_step3

INPUT1 = <<~"EOS"
  3
  1 3 1
  2 4 1
  3 5 1
EOS

OUTPUT1 = <<~"EOS"
  3
EOS

INPUT2 = <<~"EOS"
  3
  1 5 1
  2 6 2
  3 7 3
EOS

OUTPUT2 = <<~"EOS"
  3
  4
  5
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
  max_sum = -Float::INFINITY
  max_times = []
  s = [0]
  imos[...-1].each.with_index(1) do |e, i|
    s << s[-1] + e
    if max_sum < s[-1]
      max_sum = s[-1]
      max_times = [i]
    elsif max_sum == s[-1]
      max_times << i
    end
  end
  max_times
end

puts solve(STDIN.read)
