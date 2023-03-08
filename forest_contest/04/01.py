# 花言葉 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_004/forest_contest_004__d_flower_language


# 解答例1
dict = {
  "rose": "I love you",
  "cosmos": "harmony",
  "tulip": "perfect lover",
  "hydrangea": "heartlessness",
  "jasmine": "amiability"
}

key = input()
print(dict[key])

'''
花言葉 (paizaランク D 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
花の名前を入力すると、その花の花言葉を出力してくれるプログラムを作成することにしました。

あらかじめ登録しておく花と花言葉は以下になります。

・rose（バラ）: I love you（あなたを愛しています）
・cosmos（コスモス）: harmony（調和）
・tulip（チューリップ）: perfect lover（理想の恋人）
・hydrangea（アジサイ）: heartlessness（冷酷）
・jasmine（ジャスミン）: amiability（愛嬌）


入力として花の名前が与えられるので、その花の花言葉を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます

s


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
入力された花の花言葉を出力してください。

ただし、それぞれの花の花言葉は以下になります。

・rose: I love you
・cosmos: harmony
・tulip: perfect lover
・hydrangea: heartlessness
・jasmine: amiability

条件
すべてのテストケースにおいて、以下の条件をみたします。

sは、rose, cosmos, tulip, hydrangea, jasmine のいずれかの花の名前

入力例1
rose

出力例1
I love you

入力例2
jasmine

出力例2
amiability
'''