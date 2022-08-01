# 辞書データの順序 (paizaランク C 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_dictionary_step3

<<EOS

入力例1
2
MIDORIKAWA
KIRISHIMA
2
KIRISHIMA 1
KIRISHIMA 2

出力例1
3
0

入力例2
3
PAIIZA
PAIZA
PAIIIZA
2
PAIIZA 2
PAIIIZA 3

出力例2
3
2
0

EOS

n = gets.to_i
hash = {}
n.times do
  hash[gets.chomp] = 0
end

m = gets.to_i
m.times do
  key, val = gets.split
  hash[key] += val.to_i
end

sorted_hash = hash.sort.to_h
puts sorted_hash.values

=begin
n 人の人の名前 s_1, ..., s_n が与えられたのち、 m 回の「攻撃」に関する情報が与えられます。各行は “p_i a_i” というフォーマットで与えられ、 p_i はダメージを受けた人の名前 （s_1, ..., s_n のいずれか） 、 a_i は p_i が受けたダメージ数を表す数です。なお、一度もダメージを受けていない人の合計ダメージは 0 とします。

それぞれの人が受けたダメージを、人の名前のアルファベットの辞書順に出力してください。

入力される値
入力は以下のフォーマットで与えられます。

n
s_1
...
s_n
m
p_1 a_1
...
p_m a_m

1 行目には正整数 n が与えられ、 2 行目から (n + 1) 行目には人の名前 s_1, ..., s_n が改行区切りで与えられます。 (n + 2) 行目には正整数 m が与えられ、 (n + 3) 行目から (n + m + 2) 行目には人の名前 p_i （s_1, ..., s_n のいずれか） とその人が受けたダメージ a_i が "p_i a_i" という半角スペース区切りのフォーマットで m 行与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
それぞれの人が受けたダメージを、人の名前のアルファベットの辞書順に n 行出力してください（出力するのはダメージだけです）。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≤ n , a_i ≤ 50 （1 ≤ i ≤ n）
・各 s_i （1 ≤ i ≤ n） はアルファベット大文字からなる長さ 1 以上 50 以下の文字列で、互いに全て異なる

入力例1
2
MIDORIKAWA
KIRISHIMA
2
KIRISHIMA 1
KIRISHIMA 2

出力例1
3
0

入力例2
3
PAIIZA
PAIZA
PAIIIZA
2
PAIIZA 2
PAIIIZA 3

出力例2
3
2
0
=end
