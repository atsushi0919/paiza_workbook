# 年収計算 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_007/forest_contest_007__jtc_salary

INPUT1 = <<"EOS"
200 50 10
EOS
OUTPUT1 = <<"EOS"
300
EOS

INPUT2 = <<"EOS"
200 50 9
EOS
OUTPUT2 = <<"EOS"
250
EOS

# # 解答例1-1
# a, b, c = gets.split.map(&:to_i)

# if 1 <= c && c <= 4
#   a += 0
# elsif 5 <= c && c <= 9
#   a += b
# elsif 10 <= c && c <= 14
#   a += 2 * b
# elsif 15 <= c && c <= 19
#   a += 3 * b
# elsif 20 <= c && c <= 24
#   a += 4 * b
# end

# puts a

# # 解答例1-2
# a, b, c = gets.split.map(&:to_i)

# if 20 <= c
#   a += 4 * b
# elsif 15 <= c
#   a += 3 * b
# elsif 10 <= c
#   a += 2 * b
# elsif 5 <= c
#   a += b
# end

# puts a

# # 解答例2-1
# a, b, c = gets.split.map(&:to_i)

# if (5..9).include? c
#   a += b
# elsif (10..14).include? c
#   a += 2 * b
# elsif (15..19).include? c
#   a += 3 * b
# elsif (20..24).include? c
#   a += 4 * b
# end

# puts a

# # 解答例2-2
# a, b, c = gets.split.map(&:to_i)

# case c
# when 5..9
#   a += b
# when 10..14
#   a += b * 2
# when 15..19
#   a += b * 3
# when 20..24
#   a += b * 4
# end

# puts a

=begin
とある企業の場合従業員の年収は、基本給 a 円に加えて就業年数に応じて以下のように給与が加算されます。

・入社 1 ~ 4 年目、追加なし
・入社 5 ~ 9 年目、b 円追加
・入社 10 ~ 14 年目、2b 円追加
・入社 15 ~ 19 年目 3b 円追加
・入社 20 ~ 24 年目 4b 円追加

パイザさんは今年で入社 c 年目になります。今年のパイザさんの年収を計算してください。

▼　下記解答欄にコードを記入してみよう

入力される値
a b c


・ 1 行目で、従業員の基本給 a 円、就業年数に応じた給与 b 円、パイザさんの入社年次 c 年目が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
パイザさんの年収を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・200 ≦ a ≦ 300
・30 ≦ b ≦ 100
・1 ≦ c ≦ 24

入力例1
200 50 10

出力例1
300

入力例2
200 50 9

出力例2
250
=end
