# 標準入出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_std_in_out_boss

# 入出力例
INPUT1 = <<~"EOS"
  1
  Yamada 30
EOS
OUTPUT1 = <<~"EOS"
  Yamada 31
EOS

INPUT2 = <<~"EOS"
  3
  Tanaka 18
  Sato 50
  Suzuki 120
EOS

OUTPUT2 = <<~"EOS"
  Tanaka 19
  Sato 51
  Suzuki 121
EOS

=begin

# [解答例1]
# データ件数 n を受け取り整数に変換する
n = gets.to_i

# データ件数 n 回の繰り返し処理を行う
n.times do
  # gets で文字列を受けとり
  # 半角スペースで分割して各要素を name, age に代入
  name, age = gets.split
  # age を整数に変換後 +1 して
  # name と age を半角スペースの文字列に戻して出力
  puts "#{name} #{age.to_i + 1}"
end

=end

def solve(input_lines)
  # input_lines を改行区切りで分割する
  # 1行目を _ に代入（使わないので捨てる）
  # 2行目以降を members 配列に格納
  _, *members = input_lines.split("\n")

  members.map! do |member|
    name, age = member.split
    "#{name} #{age.to_i + 1}"
  end

  # members を改行区切りにして末尾にも改行を加えた文字列に変換する
  members.join("\n") << "\n"
end

puts solve(STDIN.read)

exit

=begin

# [解答例2]
def solve(input_lines)
  # 改行で分割して1行目を _, 2行目以降を members に代入
  _, *members = input_lines.split("\n")

  # membersの要素で繰り返し処理をして上書きする
  members.map! do |member|
    # 半角スペースで分割
    name, age = member.split
    # 年齢を +1 して半角スペース区切りの文字列に戻す
    "#{name} #{age.to_i + 1}"
  end

  # 改行で連結して末尾に改行を入れる
  members.join("\n") << "\n"
end

=end

puts solve(STDIN.read)
