# 複数の条件で並べ替え2 SQL

SELECT name, name_yomi, join_date
FROM customer
ORDER BY join_date DESC, name_yomi
LIMIT 30

=begin
会員のリストが、customer テーブルに保存されています。
customer テーブルの形式は次の通りです。

1. customer_id  int     会員の通し番号
2. name         varchar 会員名 漢字
3. name_yomi    varchar 会員名 フリガナ
4. join_date    date
5. residence    varchar 居住地

会員のリストを次の条件で並べ替えて、上位 30 件の会員名（漢字）、会員名（フリガナ）、入会日をすべて取得してください
・ 入会日の降順に並べ替える
・ そして、入会日が同じ場合は、会員名（フリガナ）の昇順に並べ替える

※: 会員名（フリガナ）は、カタカナからなる文字列です。

ヒント

・ SELECT カラム名1, カラム名2, ... FROM テーブル名: テーブル名 テーブルの カラム名1, カラム名2, ... のカラムの値を取得することができる
・ ORDER BY カラム名1 DESC, カラム名2: 次の条件で並べ替えることができる
・ カラム名1 カラムの値の降順
・ そして、カラム名1 カラムの値が同じとき、カラム名2 カラムの値の昇順
・ LIMIT 件数: 上位 件数 件を取得することができる
=end
