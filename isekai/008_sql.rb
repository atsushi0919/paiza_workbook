SELECT *
FROM ordered_menu
LIMIT 50;


=begin
上から 50 件を取得しよう
注文内容が、ordered_menu テーブルに保存されています。
ordered_menu テーブルの形式は次の通りです。

1. order_id int 注文番号
2. menu_id  int メニュー番号
3. num      int 注文数
4. sum      int 小計

注文内容の上から 50 件をすべて取得してください。

ヒント

・ SELECT * FROM テーブル名: テーブル名 テーブルのすべてのレコードを取得することができる
・ LIMIT 件数: 上から 件数 件を取得することができる
=end
