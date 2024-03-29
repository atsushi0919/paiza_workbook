# かくれんぼ (paizaランク B 相当)
# https://paiza.jp/works/mondai/dag_memoization_search/dag_memoization__problems_step7

INPUT1 = <<"EOS"
6 5
1 2
1 3
2 4
2 5
3 6
EOS
OUTPUT1 = <<"EOS"
4
EOS

# 入力
input_lines = INPUT1.split("\n")
n, m = input_lines.shift.split.map(&:to_i)
st = input_lines.shift(m).map { |e| e.split.map(&:to_i) }

# 隣接リスト
ad_list = Array.new(n) { [] }
st.each do |s, t|
  ad_list[s - 1] <<= t - 1
  ad_list[t - 1] <<= s - 1
end

# 行き止まりの部屋から調べる
tr = ad_list.each_index.select { |i| ad_list[i].length == 1 }
search_list = tr.map { |e| [0, e] }
searched = Array.new(n)
num_of_doors = 0

p search_list

=begin
京子ちゃんはこれから友達とかくれんぼをしようとしています。
かくれんぼのフィールドは N 個の部屋でおこなわれ、部屋 S_i と部屋 T_i は扉を介してつながっています。かくれんぼの会場は非常に特殊で、
どの二つの部屋 X, Y を選んでも部屋 X から部屋 Y へ行くルートはかならず 1 通りです。

かくれんぼでは最初の立ち位置が非常に重要です。そこで、京子ちゃんはかくれんぼの鬼役の友達に「最初はこの部屋で待機してほしい」と伝えることで、
鬼との距離ができるだけ離れた状態でかくれんぼを始めようと考えました。
京子ちゃんと鬼役の友達の初期位置をあなたが自由に決められるとき、
鬼役の友達が最短経路で京子ちゃんと同じ部屋に行くために最大でいくつの扉を開ける必要がありますか？ただし、京子ちゃんは初期位置から一歩も動きません。

▼　下記解答欄にコードを記入してみよう

入力される値
N M
S_1 T_1
S_2 T_2
...
S_M T_M


・ 1 行目に、部屋の数 N と、扉の数 M が与えられます。
・ 2 行目から M + 1 行目にかけて、扉の情報が与えられます。部屋 S_i と部屋 T_i が扉を介してつながっています。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
鬼役の友達が最短経路で京子ちゃんと同じ部屋に行くために開ける必要がある扉の数の最大値を答えてください。

また、末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 1 ≦ N, M ≦ 100,000
・ 1 ≦ S_i, T_i ≦ N
・ どの二つの部屋 X, Y を選んでも部屋 X から部屋 Y へ行くルートはかならず 1 通り

入力例1
6 5
1 2
1 3
2 4
2 5
3 6

出力例1
4
=end
