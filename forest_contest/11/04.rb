# 残業時間 (paizaランク C 相当)
# https://paiza.jp/works/mondai/forest_contest_011/forest_contest_011__c_overwork

p`dd`.split.map(&:to_i).sum-240

=begin
一般的な勤務体系の場合、1日8時間を超えて働くと、「残業」となります。
1 ヶ月間(30日間)でi (1 ≦ i ≦ 30)日目のパイザ君の勤務時間は m_i でした。
この月のパイザくんの残業時間を計算してください。

▼　下記解答欄にコードを記入してみよう

入力される値
m_1
m_2
...
m_30


・ 30 行のうち i (1 ≦ i ≦ 30) 行目には、i 日目の勤務時間 m_i が半角スペース区切りで与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
この月のパイザくんの残業時間を出力してください。

条件
すべてのテストケースにおいて、以下の条件をみたします。

・ 8 ≦ m_i ≦ 14

入力例1
13
10
11
9
11
14
9
9
8
9
14
8
14
14
10
14
14
13
13
13
14
9
13
10
12
8
11
8
11
8

出力例1
94
=end
