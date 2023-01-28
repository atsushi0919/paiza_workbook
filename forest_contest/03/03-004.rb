# キーボードのシミュレーション (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_003/forest_contest_003__c_keyboard

# 入出力例
INPUT1 = <<"EOS"
3
a
shift b
c
EOS
OUTPUT1 = <<"EOS"
aBc
EOS

INPUT2 = <<"EOS"
7
a
capslock
b
c
d
capslock
f
EOS
OUTPUT2 = <<~"EOS"
  aBCDf
EOS

# 解答例1
# 入力
n = gets.to_i
c = n.times.map { gets.split }

display = ""
capslock = false
# n 行の入力で繰り返し処理
c.each do |keys|
  key1, key2 = keys
  case key1
  when "capslock"
    # capslock の ON/OFF 切り替え
    capslock = !capslock
  when "shift"
    # shift と一緒に押されたキーの大文字を display に追加
    display <<= key2.upcase
  else
    # capslock ON なら大文字, OFF なら小文字を display に追加
    display <<= capslock ? key1.upcase : key1
  end
end

# 出力
puts display
