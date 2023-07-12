# 親と子 (paizaランク D 相当)
# https://paiza.jp/works/mondai/forest_contest_010/forest_contest_010__d_parent_and_child

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

答えは、「No」なんだばって、
もし、（甲 * ２ + １ = 乙）または、（甲 * ２ + ２ = 乙）ならば
    答えは、「Yes」だんず。
ここまでだんず。

答えを表示してけろじゃ。


# 配列で二分木を表現するときには、親のノードの番号を 2 倍して 1 または 2 を足した値を子のノードの番号にすると
# うまく実装できることが知られています。

# ノードAとノードBの番号が与えられるので、Aの子がBであるかを判定してください。

# ▼　下記解答欄にコードを記入してみよう

# 入力される値
# a b


# ・ a はノードAの番号で、b はノードBの番号です。

# 入力値最終行の末尾に改行が１つ入ります。
# 文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
# 期待する出力
# ノードAの子がノードBであるならば、"Yes"を、そうでいならば"No"を表示してください。

# 条件
# すべてのテストケースにおいて、以下の条件をみたします。

# ・ 0 ≦ a, b ≦ 100

# 入力例1
# 2 5

# 出力例1
# Yes

# 入力例2
# 2 6

# 出力例2
# Yes

# 入力例3
# 2 3

# 出力例3
# No
