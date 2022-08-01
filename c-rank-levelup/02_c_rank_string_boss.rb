# 文字列 (paizaランク C 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_string_boss

INPUT1 = <<~"EOS"
  1
  13:00 1 30
EOS
OUTPUT1 = <<~"EOS"
  14:30
EOS

INPUT2 = <<~"EOS"
  2
  15:59 0 1
  23:20 1 0
EOS
OUTPUT2 = <<~"EOS"
  16:00
  00:20
EOS

# [解答例1]
def solve(input_lines)
  # input_lines を改行区切りで分割する
  # 1行目を _ に代入（使わないので捨てる）
  # 2行目以降を配列 schedules に格納
  _, *schedules = input_lines.split("\n")

  result = schedules.map do |schedule|
    # 3文字目 ":" を半角スペースに変更
    schedule[2] = " "
    s_h, s_m, w_h, w_m = schedule.split.map(&:to_i)

    # 終了時刻 分の計算
    f_m = s_m + w_m
    if f_m >= 60
      f_m -= 60
      w_h += 1
    end
    # 終了時刻 時間の計算
    f_h = s_h + w_h
    if f_h >= 24
      f_h -= 24
    end

    # 時間・分を文字列に変換する
    # 文字数が 1 なら 先頭に "0" を加えて埋め 2桁 にする
    f_h = f_h.to_s
    f_h = "0" << f_h if f_h.length == 1
    f_m = f_m.to_s
    f_m = "0" << f_m if f_m.length == 1

    # hh:mm 形式の文字列を返す
    "#{f_h}:#{f_m}"
  end
  # 処理結果の配列を改行区切りで連結し末尾に改行を連結
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

exit

# [解答例2]
def solve(input_lines)
  _, *schedules = input_lines.split("\n")

  result = schedules.map do |schedule|
    # 正規表現を使って ":" か " " で分割する
    s_h, s_m, w_h, w_m = schedule.split(/[: ]/).map(&:to_i)

    # 終了時刻 分の計算
    f_m = s_m + w_m
    if f_m >= 60
      f_m -= 60
      w_h += 1
    end
    # 終了時刻 時間の計算
    f_h = s_h + w_h
    if f_h >= 24
      f_h -= 24
    end

    # 終了時刻の時間・分を0埋め2桁の文字列に変換
    "%02d:%02d" % [f_h, f_m]
  end
  # 処理結果の配列を改行区切りで連結し末尾に改行を連結
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

# [参考(Timeクラス)]
def solve(input_lines)
  _, *schedules = input_lines.split("\n")

  result = schedules.map do |schedule|
    # 正規表現を使って ":" か " " で分割する
    s_h, s_m, w_h, w_m = schedule.split(/[: ]/).map(&:to_i)
    # 開始時刻で Time クラスのインスタンスを生成する(時・分以外の情報はダミー)
    start_time = Time.local(Time.now.year, 1, 1, s_h, s_m)
    # 所要時間を秒に換算して開始時刻に加算する
    finish_time = start_time + 3600 * w_h + 60 * w_m
    # strftimeメソッドで "hh:mm" 形式の文字列を返す
    finish_time.strftime("%H:%M")
  end
  # 終了時刻の配列を改行区切りで連結して末尾に改行を追加する
  result.join("\n") << "\n"
end

puts solve(STDIN.read)
