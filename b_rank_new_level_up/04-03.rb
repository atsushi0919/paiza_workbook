# 【全探索 3】+1, -1, '1'+, +'1' (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__lucky_number

INPUT1 = <<"EOS"
3
111
222
333
EOS
OUTPUT1 = <<"EOS"
109
EOS

INPUT2 = <<"EOS"
5
123
456
789
901
234
EOS
OUTPUT2 = <<"EOS"
3
EOS

def fortune_telling_nums(num)
  nums = []
  nums << num
  nums << num + 1
  nums << num - 1
  nums << ("1" + num.to_s).to_i
  nums << (num.to_s + "1").to_i
  nums.uniq
end

# 入力
_, *x = $stdin.read.split.map(&:to_i)

# lucky number 計算用の番号対応表
numbering_table = {}
x.each { |num| numbering_table[num] ||= fortune_telling_nums(num) }

# lucky number を調べる
lucky_number = 999_999
x.combination(2) do |org_num1, org_num2|
  numbering_table[org_num1].each do |fortune_num1|
    numbering_table[org_num2].each do |fortune_num2|
      lucky_number = [(fortune_num1 - fortune_num2).abs, lucky_number].min
    end
  end
end

# 出力
puts lucky_number

# numbering_table1.to_a.product(numbering_table2.to_a).each do |num1, num2|
#   lucky_number = [(num1 - num2).abs, lucky_number].min
# end

# # 出力
# puts lucky_number

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
有名な占い師である paiza 君は次のようなラッキーナンバーの求め方を提唱しました。



占い師が N 個の自然数 X_1, ..., X_N を宣言する。

それらから 2 つの自然数を選ぶような全ての組み合わせについて次の操作をおこなう。

選んだ 2 つの各数字に対して、次のいずれかの操作を 1 回おこなうことができる。各数字について別々の操作をおこなうことができる。（おこわなくても良い）

・その数字を +1 する。ex)25->26

・その数字を -1 する。ex)25->24

・その数字を、その数字の先頭に 1 をつけた数に置き換える。ex)25>125

・その数字を、その数字の末尾に 1 をつけた数に置き換える。ex)25->251

操作後の 2 つの数の差の絶対値の最小値を求める。




2. で求めることができる値のうち最小の値をラッキーナンバーとする。



占い師が宣言した自然数 X_1, ..., X_N が与えられるので、試しにこの方法でラッキーナンバーを計算してみましょう。
▼　下記解答欄にコードを記入してみよう

入力される値
N
X_1
...
X_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
lucky_number
条件
・2 ≦ N ≦ 8
・1 ≦ X_i ≦ 100000

入力例1
3
111
222
333

出力例1
109

入力例2
5
123
456
789
901
234

出力例2
3
=end
