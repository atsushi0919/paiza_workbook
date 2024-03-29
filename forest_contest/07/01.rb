# 占い (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_007/forest_contest_007__fortune_telling

INPUT1 = <<"EOS"
7
EOS
OUTPUT1 = <<"EOS"
Yes
EOS

INPUT2 = <<"EOS"
3
EOS
OUTPUT2 = <<"EOS"
No
EOS

# 解答例1-1
n = gets.to_i

if n == 7
  puts "Yes"
else
  puts "No"
end

# 解答例1-2
puts gets.chomp == "7" ? "Yes" : "No"

=begin
ある占いでは、箱の中に 1~9 までのいずれかの数字が書かれている玉を取り出し、その玉に書かれている数字から運勢を占います。
玉に書かれている数字が 7 の時は大吉となります。占いで取り出した玉に書かれている数字が 1 つ与えられます。大吉かどうかを判定してください。

入力される値
n


・ 1 行目に取り出した玉に書かれている数字 n が入力されます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
大吉の場合は「Yes」、そうでない場合は「No」と 1 行に出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 1 ≦ n ≦ 9

入力例1
7

出力例1
Yes

入力例2
3

出力例2
No
=end
