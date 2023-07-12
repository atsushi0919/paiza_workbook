# 座席 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_010/forest_contest_010__d_seat

# おまじないだんず
exec "cnako3", "-e", DATA.read
__END__
●んず。ここまで
●だんず。ここまで
●けろじゃ。ここまで


定数の半角空白は、「 」だんず。

「/dev/stdin」から開いて、入力文字列に代入するんず。
入力文字列をトリムして改行で区切って、名前配列に代入するんず。

名前配列の要素数が０超の間
    名前配列の０から３を配列取出しして、表示配列に代入するんず。
  
    表示配列を半角空白で配列結合して、表示してけろじゃ。
ここまでだんず。


# 9人のお客さんを3人がけの椅子に案内します。
# 案内の対象となる客さんの名前が各行で与えられるので、与えられた順で1行に3人ずつをスペース区切りで表示してください。

# ▼　下記解答欄にコードを記入してみよう

# 入力される値
# a
# b
# c
# d
# e
# f
# g
# h
# i


# ・ a, b, c, d, e, f, g, h, iは案内の対象となるお客さんの名前です。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
# 期待する出力
# 与えられた順で1行に3人ずつをスペース区切りで出力してください。


# a b c
# d e f
# g h i
# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・ a, b, c, d, e, f, g, h, iは半角英数字からなる文字列
# ・ a, b, c, d, e, f, g, h, iの文字数は1文字以上10文字以下

# 入力例1
# kirishima
# midorikawa
# rokumura
# kuroda
# neko
# marguerite
# kino
# noda
# lilia

# 出力例1
# kirishima midorikawa rokumura
# kuroda neko marguerite
# kino noda lilia