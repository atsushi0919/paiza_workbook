# 辞書 (paizaランク C 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_dictionary_boss

INPUT1 = <<~"EOS"
  2 2 2
  2 1
  1 2
  1 1
  2 2
EOS
OUTPUT1 = <<~"EOS"
  1 2
  2 1
EOS

INPUT2 = <<~"EOS"
  2 3 4
  1 3
  2 1
  2 3
  3 3
  1 4
EOS
OUTPUT2 = <<~"EOS"
  1 3
  2 4
EOS

=begin
def solve(input_lines)
  # 標準入力の受け取り
  input_lines = input_lines.split("\n")
  p, q, r = input_lines.shift.split.map(&:to_i)
  a_to_b = {}
  input_lines.shift(p).each do |line|
    key, val = line.split.map(&:to_i)
    a_to_b[key] = val
  end
  b_to_c = {}
  input_lines.shift(q).each do |line|
    key, val = line.split.map(&:to_i)
    b_to_c[key] = val
  end

  # AグループとCグループの繋がりを調べる
  a_to_c = {}
  a_to_b.each do |key, val|
    # a_to_b の値が b_to_c のキーとなる
    a_to_c[key] = b_to_c[val]
  end

  # a_to_c をAグループの番号順でソートする([key, val] の配列になる）
  sorted_ary = a_to_c.sort

  # 行を改行で連結、行の要素を半角スペースで連結にして末尾に改行を追加
  sorted_ary.map { |item| item.join(" ") }.join("\n") << "\n"
end

puts solve(STDIN.read)

=end

def solve(input_lines)
  # 標準入力の受け取り
  input_lines = input_lines.split("\n")
  p, q, r = input_lines.shift.split.map(&:to_i)
  a_to_b = input_lines.shift(p).map { |line| line.split.map(&:to_i) }.to_h
  b_to_c = input_lines.shift(q).map { |line| line.split.map(&:to_i) }.to_h

  # AグループとCグループの繋がりを調べる(to_h はなくてもOK)
  a_to_c = a_to_b.map { |key, val| [key, b_to_c[val]] }.to_h

  # a_to_c をAグループの番号順でソートして形式を整えて出力する
  a_to_c.sort.map { |item| item.join(" ") }.join("\n") << "\n"
end

puts solve(STDIN.read)

exit

p, q, r = gets.split.map(&:to_i)
a_to_b = {}
p.times do
  a, b = gets.split.map(&:to_i)
  a_to_b[a] = b
end

b_to_c = {}
q.times do
  b, c = gets.split.map(&:to_i)
  b_to_c[b] = c
end

a_to_c = a_to_b.each.map { |key, val| [key, b_to_c[val]] }.sort.to_h
a_to_c.each { |a, c| puts "#{a} #{c}" }

=begin
p 人のグループ A , q 人のグループ B , r 人のグループ C があります。
各グループのメンバーにはそれぞれ番号がつけられており、
A グループの i 番目の人は B グループの j 番目の人に仕事を任せ、
B グループの j 番目の人は与えられた仕事を C グループの k 番目の人に任せます。
すると結局、 A グループの i 番目の人の仕事をするのは C グループの k 番目の人だということになります。

パイザ君は A グループの各人の仕事を結局 C グループの誰が行うことになるのか知りたがっています。
A グループの人のそれぞれが最終的に C グループの誰に仕事を頼むことになるのかを、
A グループの人の番号が小さい順に p 行出力してください。

入力される値
入力は以下のフォーマットで与えられます。

p q r
i_1 j_1
...
i_p j_p
j'_1 k_1
...
j'_q k_q

1 行目には A グループ、 B グループ、 C グループのそれぞれの人数 p , q , r が半角スペース区切りで与えられます。
2 行目から (p + 1) 行目までは 
A グループの人の番号とその人が仕事を頼む B グループの人の番号 i_a, j_a （1 ≤ a ≤ p） が半角スペース区切りで、
(p + 2) 行目から (p + q + 2) 行目までは
B グループの人の番号とその人が仕事を頼む C グループの人の番号 j’_b , k_b （1 ≤ b ≤ q） が半角スペース区切り

で与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください

期待する出力
A グループの i_c 番目の人が C グループの k_c 番目の人に仕事を頼むとしたとき （1 ≤ c ≤ p） 、
各 i_c, k_c をそれぞれ半角スペース区切りで、 i_c が小さい順に p 行出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≤ p , q , r ≤ 50
・1 ≤ i_a ≤ p , 1 ≤ j_a , j'_b ≤ q , 1 ≤ k_b ≤ r （1 ≤ a ≤ p , 1 ≤ b ≤ q）
・各 i_a は全て異なる
・各 j'_b は全て異なる

A グループから仕事を頼まれた B グループの人は必ずその仕事を C グループの誰かに頼みます。
 B グループに関する入力には「余計な」ものも含まれます。
 すなわち、 A グループの誰からも仕事を頼まれていない B グループの人に関して、
 その人が C グループの誰に仕事を頼むかについての情報が与えられることもあります。

入力例1
2 2 2
2 1
1 2
1 1
2 2

OUTPUT1 = <<~"EOS"
1 2
2 1

INPUT2 = <<~"EOS"
2 3 4
1 3
2 1
2 3
3 3
1 4


OUTPUT2 = <<~"EOS"
1 3
2 4
=end
