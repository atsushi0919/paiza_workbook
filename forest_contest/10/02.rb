# 平均と平均 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_010/forest_contest_010__d_mean_and_mean

# おまじないだんず
exec "cnako3", "-e", DATA.read
__END__
●んず。ここまで
●だんず。ここまで
●けろじゃ。ここまで
●なんだばって。ここまで


定数の半角空白は、「 」だんず。

「/dev/stdin」から開いて、入力文字列に代入するんず。
入力文字列をトリムして半角空白で区切って、ｔｍｐに代入するんず。
甲, 乙は、ｔｍｐだんず。

相加平均は、（甲 + 乙） / ２ だんず。
相乗平均は、（甲 * 乙）の平方根だんず。

答えは、「equal」なんだばって
もし、（相加平均 > 相乗平均）ならば
    答えは、「arithmetic」だんず。
違えば、もし、（相加平均 < 相乗平均）ならば
    答えは、「geometric」だんず。
ここまでだんず。

答えを表示してけろじゃ。


# paizaくんは相加平均と相乗平均のどちらが大きいのかを知りたがっています。

# a と bの相加平均は (a + b) / 2 で計算できます。
# a と bの相乗平均は √(a * b) で計算できます。

# a と bの相加平均と相乗平均を比べたときに、相加平均の方が大きい場合には "arithmetic"、 相乗平均の方が大きい場合には "geometric"、等しい場合には "equal" と表示してください。

# ▼　下記解答欄にコードを記入してみよう

# 入力される値
# a b


# ・ 1 行目に a と b がそれぞれ半角スペース区切りで与えられます。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
# 期待する出力
# "arithmetic" か "geometric" を1行で表示してください。

# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・ 3 ≦ a < b ≦ 100

# 入力例1
# 3 4

# 出力例1
# arithmetic
