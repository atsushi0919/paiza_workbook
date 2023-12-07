SELECT *
FROM ordered_menu
ORDER BY num DESC;

=begin
注文数の降順に並べ替えよう
注文内容が、ordered_menu テーブルに保存されています。
ordered_menu テーブルの形式は次の通りです。

1. orderd_id  int 注文id
2. menu_id    int メニューid
3. num        int 注文数
4. sum        int 小計

注文内容を「メニューの注文数」の降順に並べ替えてすべて取得してください。

ヒント

・ SELECT * FROM テーブル名: テーブル名 テーブルのすべてのレコードを取得することができる
・ ORDER BY カラム名 DESC: カラム名 カラムの値の降順に並べ替えることができる
=end
