# お金の支払い
# https://paiza.jp/works/mondai/double_roop_problems/double_roop_problems__payment

INPUT1 = <<"EOS"
500 1000 300
EOS
OUTPUT1 = <<"EOS"
300
EOS

INPUT2 = <<"EOS"
100 80 50 10 5 240
EOS
OUTPUT2 = <<"EOS"
300
EOS

*a,z=gets.split.map(&:to_i);(a<<1).select!{|c|c<=z};l=a.size
t=Array.new(l+1){Array.new(z+1,9999)};t[0][0]=0
1.upto(l){|i|c=a[i-1];0.upto(z){|j|t[i][j]=j<c ? t[i-1][j]:[t[i][j-c]+1,t[i-1][j]].min}}
p t[-1][-1]

=begin
paiza国では、1 円と X 円と Y 円の 3 種類の硬貨しかありません。
ちょうど Z 円を支払うとき、支払う硬貨の枚数が最小になるように支払ったときの硬貨の枚数を求めてください。
ただし、支払う各硬貨の枚数に制限は無いものとします。

入力される値
入力は標準入力にて以下のフォーマットで与えられます。

X Y Z
・ あなたの持っている硬貨の金額 X , Y と、あなたが払う金額 Z が半角スペース区切りで 1 行で与えられます。

条件
すべてのテストケースにおいて、以下の条件をみたします。
・ 2 ≦ X , Y ≦ 1000
・ X != Y
・ 1 ≦ Z ≦ 3000

出力される値
支払う硬貨の枚数の最小値を 1 行で出力してください。
出力の末尾には改行を入れてください。

入力例

500 1000 300

出力例

300
=end
