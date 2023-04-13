# 【文字列 1】疑似数字 (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__like_numbers

INPUT1 = <<"EOS"
81zaaz18
EOS
OUTPUT1 = <<"EOS"
8
81
81zaaz1
81zaaz18
1
1zaaz1
1zaaz18
1
18
8
EOS

INPUT2 = <<"EOS"
1abc2efg345
EOS
OUTPUT2 = <<"EOS"
1
1abc2
1abc2efg3
1abc2efg34
1abc2efg345
2
2efg3
2efg34
2efg345
3
34
345
4
45
5
EOS

# 入力
s = gets.chomp

# 文字が数字の index を取り出す
num_idx = s.chars.map.with_index { |e, i| e.match(/\d/) ? i : nil }.compact

# num_idx の組み合わせから疑似数字を生成
res = []
0.upto(num_idx.length - 1) do |i|
  i.upto(num_idx.length - 1) { |j| res << s[num_idx[i]..num_idx[j]] }
end

# 出力
puts res.join("\n")

=begin
文字列からいきなり電話番号を取得するのは難しいと考えた paiza 君は、
最初の文字と最後の文字が数字(0~9)であるような文字列を「疑似数字」として取り出すコードを作成することにしました。

文字列 S が与えられるので、そこに含まれる疑似数字を全て出力してください。
数字 1 文字の場合であっても疑似数字とみなされる点に注意してください。

▼　下記解答欄にコードを記入してみよう

入力される値
S

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
S の 1 文字目から始まる疑似数字のうち、末尾の文字が S の 1 文字目に最も近い疑似数字
S の 1 文字目から始まる疑似数字のうち、末尾の文字が S の 1 文字目に 2 番目近い疑似数字
...
S の 2 文字目から始まる疑似数字のうち、末尾の文字が S の 2 文字目に最も近い疑似数字
...


・上のような順番で全ての疑似数字を改行区切りで出力してください。
・詳しくは入出力例を参照してください。
条件
・1 ≦ |S| ≦ 100
・S はアルファベット小文字(a~z)と数字(0~9)からなる文字列

入力例1
81zaaz18

出力例1
8
81
81zaaz1
81zaaz18
1
1zaaz1
1zaaz18
1
18
8

入力例2
1abc2efg345

出力例2
1
1abc2
1abc2efg3
1abc2efg34
1abc2efg345
2
2efg3
2efg34
2efg345
3
34
345
4
45
5
=end
