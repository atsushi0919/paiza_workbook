# 大きな数値を 3 けたごとにカンマ区切りで出力 (paizaランク C 相当)
# https://paiza.jp/works/mondai/stdout_primer/stdout_primer__specific_split_step6

# 入出力例
INPUT1 = <<~"EOS"
  123456789
EOS
OUTPUT1 = <<~"EOS"
  123,456,789
EOS

INPUT2 = <<~"EOS"
  813
EOS
OUTPUT2 = <<~"EOS"
  813
EOS

INPUT3 = <<~"EOS"
  123456789123456789
EOS
OUTPUT3 = <<~"EOS"
  123,456,789,123,456,789
EOS

# 解答例
# 入力
n = gets.to_i
# n を文字列に変換する
s = n.to_s
# s 末尾のインデックス
e_i = s.length - 1
# i=0 から e_i までカウントアップしながら繰り返す
c_s = ""
0.upto(e_i) do |i|
  # s[i] を文字列 c_s に追加
  c_s += s[i]
  # 末尾以外かつ 3 の倍数のなら文字列 c_s にカンマ"," を追加
  if i != e_i && (i + 1) % 3 == 0
    c_s += ","
  end
end
# 出力
puts(c_s)

# 解答例2
# 入力
n = gets.to_i
# 3 桁毎に "," を挿入した文字列を生成
s = n.to_s.gsub(/(\d{3})(?!\z)/, '\0,')
puts(s)
