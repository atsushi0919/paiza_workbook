# 数字の文字列操作（時刻2） (paizaランク D 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_string_step6

INPUT1 = <<~"EOS"
  01:02
EOS
OUTPUT1 = <<~"EOS"
  01:32
EOS

INPUT2 = <<~"EOS"
  12:31
EOS
OUTPUT2 = <<~"EOS"
  13:01
EOS

=begin
# [解答例1]
h, m = gets.split(":").map(&:to_i)

# 30分を加えて60分以上なら繰り上がり処理
m += 30
if m >= 60
  m -= 60
  h += 1
end
# 24時(以上)なら0時に変換
if h >= 24
  h -= 24
end

# h, m を文字列に変換して文字数が 1 なら頭に "0" を追加
h = h.to_s
h = "0" << h if h.length == 1
m = m.to_s
m = "0" << m if m.length == 1

puts "#{h}:#{m}"
=end

# [解答例2]
h, m = gets.split(":").map(&:to_i)
# Timeクラスのインスタンスを生成
time = Time.local(2021, 1, 1, h, m)
# 30分を秒に換算して time に加算
time += 60 * 30

# strftimeメソッドで "hh:mm" 形式の文字列を生成して出力
puts time.strftime("%H:%M")
