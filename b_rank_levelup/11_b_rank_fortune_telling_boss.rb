# 占い (paizaランク C 相当)
# https://paiza.jp/works/mondai/prob60/fortune_telling_9

INPUT1 = <<~"EOS"
  5
  Kyoko B
  Rio O
  Tsubame AB
  KurodaSensei A
  NekoSensei A
  4
  A red
  B green
  O blue
  AB yellow
EOS
OUTPUT1 = <<~"EOS"
  Kyoko green
  Rio blue
  Tsubame yellow
  KurodaSensei red
  NekoSensei red
EOS

INPUT2 = <<~"EOS"
  5
  Kyoko shishiza
  Rio futagoza
  Tsubame otomeza
  KurodaSensei yagiza
  NekoSensei mizugameza
  5
  shishiza the_first_person
  yagiza the_second_person
  otomeza the_first_cat
  mizugameza the_first_dog
  futagoza NekoSensei
EOS
OUTPUT2 = <<~"EOS"
  Kyoko the_first_person
  Rio NekoSensei
  Tsubame the_first_cat
  KurodaSensei the_second_person
  NekoSensei the_first_dog
EOS

INPUT3 = <<~"EOS"
  3
  AAA aaa111
  BBB bbb222
  CCC ccc333
  5
  aaa111 zzz
  bbb222 yyy
  ccc333 xxx
  ddd444 www
  eee555 vvv
EOS
OUTPUT3 = <<~"EOS"
  AAA zzz
  BBB yyy
  CCC xxx
EOS

def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  users = {}
  input_lines.shift(n).each do |line|
    name, type = line.split
    users[name] = type
  end
  m = input_lines.shift.to_i
  fortune_telling = {}
  input_lines.shift(m).each do |line|
    type, fortune = line.split
    fortune_telling[type] = fortune
  end

  # ユーザーを先頭から順に占う
  # 名前と結果を半角スペースで連結して配列に格納する
  result = []
  users.each do |name, type|
    result.push("#{name} #{fortune_telling[type]}")
  end

  # 判定結果を改行で連結し末尾に改行を追加
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

exit
=begin
# [解答例1]
def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  users = {}
  input_lines.shift(n).each do |line|
    name, type = line.split
    users[name] = type
  end
  m = input_lines.shift.to_i
  fortune_telling = {}
  input_lines.shift(m).each do |line|
    type, fortune = line.split
    fortune_telling[type] = fortune
  end

  # 名前と結果を半角スペースで連結して配列に格納する
  result = []
  users.each do |name, type|
    result.push("#{name} #{fortune_telling[type]}")
  end

  # 配列を改行で連結して末尾に改行を追加する
  result.join("\n") << "\n"
end
=end

# [解答例2]
def solve(input_lines)
  # 入力データ受け取り
  input_lines = input_lines.split("\n")
  n = input_lines.shift.to_i
  users = input_lines.shift(n).map { |line| line.split }.to_h
  m = input_lines.shift.to_i
  fortune_telling = input_lines.shift(m).map { |line| line.split }.to_h

  # 名前と結果を半角スペースで連結して配列に格納する
  result = users.map { |name, type| "#{name} #{fortune_telling[type]}" }

  # 配列を改行で連結して末尾に改行を追加する
  result.join("\n") << "\n"
end

puts solve(STDIN.read)

pp solve(INPUT1)
# > [["Kyoko", "green"],
# >  ["Rio", "blue"],
# >  ["Tsubame", "yellow"],
# >  ["KurodaSensei", "red"],
# >  ["NekoSensei", "red"]]
pp solve(INPUT2)
# > [["Kyoko", "the_first_person"],
# >  ["Rio", "NekoSensei"],
# >  ["Tsubame", "the_first_cat"],
# >  ["KurodaSensei", "the_second_person"],
# >  ["NekoSensei", "the_first_dog"]]
pp solve(INPUT3)

=begin
# 確認用コード
pp solve(INPUT1)
# > ["Kyoko green",
# >  "Rio blue",
# >  "Tsubame yellow",
# >  "KurodaSensei red",
# >  "NekoSensei red"]
pp solve(INPUT2)
# > ["Kyoko the_first_person",
# >  "Rio NekoSensei",
# >  "Tsubame the_first_cat",
# >  "KurodaSensei the_second_person",
# >  "NekoSensei the_first_dog"]
pp solve(INPUT3)
# > ["AAA zzz", "BBB yyy", "CCC xxx"]
=end

=begin
# 確認用コード
pp INPUT1
# > "5\n" +
# > "Kyoko B\n" +
# > "Rio O\n" +
# > "Tsubame AB\n" +
# > "KurodaSensei A\n" +
# > "NekoSensei A\n" +
# > "4\n" +
# > "A red\n" +
# > "B green\n" +
# > "O blue\n" +
# > "AB yellow\n"
pp OUTPUT1
# > "Kyoko green\n" +
# > "Rio blue\n" +
# > "Tsubame yellow\n" +
# > "KurodaSensei red\n" +
# > "NekoSensei red\n"
pp INPUT2
# > "5\n" +
# > "Kyoko shishiza\n" +
# > "Rio futagoza\n" +
# > "Tsubame otomeza\n" +
# > "KurodaSensei yagiza\n" +
# > "NekoSensei mizugameza\n" +
# > "5\n" +
# > "shishiza the_first_person\n" +
# > "yagiza the_second_person\n" +
# > "otomeza the_first_cat\n" +
# > "mizugameza the_first_dog\n" +
# > "futagoza NekoSensei\n"
pp OUTPUT2
# > "Kyoko the_first_person\n" +
# > "Rio NekoSensei\n" +
# > "Tsubame the_first_cat\n" +
# > "KurodaSensei the_second_person\n" +
# > "NekoSensei the_first_dog\n"
pp INPUT3
# > "3\n" +
# > "AAA aaa111\n" +
# > "BBB bbb222\n" +
# > "CCC ccc333\n" +
# > "5\n" +
# > "aaa111 zzz\n" +
# > "bbb222 yyy\n" +
# > "ccc333 xxx\n" +
# > "ddd444 www\n" +
# > "eee555 vvv\n"
pp OUTPUT3
# > "AAA zzz\n" + "BBB yyy\n" + "CCC xxx\n"
=end

=begin
次のような占いプログラムを作成してください。

「ユーザー」と「ユーザーに対応する血液型」、
「血液型」と「血液型に対応する占い結果」が与えられます。

それぞれのユーザーに対応する占い結果を表示してください。

入力例の1つ目は、ユーザーの血液型についてのラッキーカラーの占いです。

入力例の2つ目は、ユーザーの星座についてのラッキーパーソンの占いになっています。
「血液型」として「星座」などのさまざまな文字列を利用できるようにすることで、
他の占いにも対応する必要があることに注意してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

n
(ユーザー_1) (ユーザー_1の血液型)
(ユーザー_2) (ユーザー_2の血液型)
(ユーザー_3) (ユーザー_3の血液型)
...
(ユーザー_i) (ユーザー_iの血液型)
...
(ユーザー_n) (ユーザー_nの血液型)
m
(血液型_1) (血液型_1の占い結果)
(血液型_2) (血液型_2の占い結果)
(血液型_3) (血液型_3の占い結果)
...
(血液型_j) (血液型_jの占い結果)
..
(血液型_m) (血液型_mの占い結果)


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
1から n までの各ユーザーについて順に、ユーザーとその占い結果を半角スペース区切りで出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ n ≦100
・1 ≦ m ≦100
・(ユーザー_i)は、半角英数字からなる1から20文字までの文字列
・(血液型_j)は、半角英数字からなる1から20文字までの文字列
・(血液型_jの占い結果)は、半角英数字からなる1から20文字までの文字列
・(ユーザー_iの血液型)と等しい、(血液型_j)が必ず存在
・i ≠kのとき、(ユーザー_i)と(ユーザー_k)は異なる文字列
・j ≠kのとき、(血液型_j)と(血液型_k)は異なる文字列

入力例1
5
Kyoko B
Rio O
Tsubame AB
KurodaSensei A
NekoSensei A
4
A red
B green
O blue
AB yellow

出力例1
Kyoko green
Rio blue
Tsubame yellow
KurodaSensei red
NekoSensei red

入力例2
5
Kyoko shishiza
Rio futagoza
Tsubame otomeza
KurodaSensei yagiza
NekoSensei mizugameza
5
shishiza the_first_person
yagiza the_second_person
otomeza the_first_cat
mizugameza the_first_dog
futagoza NekoSensei

出力例2
Kyoko the_first_person
Rio NekoSensei
Tsubame the_first_cat
KurodaSensei the_second_person
NekoSensei the_first_dog

入力例3
3
AAA aaa111
BBB bbb222
CCC ccc333
5
aaa111 zzz
bbb222 yyy
ccc333 xxx
ddd444 www
eee555 vvv

出力��3
AAA zzz
BBB yyy
CCC xxx
=end
