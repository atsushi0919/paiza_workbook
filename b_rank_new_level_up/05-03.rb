# 【文字列 3】p4!2@ (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__leet_paiza

INPUT1 = <<"EOS"
leetp@1za
EOS
OUTPUT1 = <<"EOS"
leet
EOS

INPUT2 = <<"EOS"
nopaizanostudy
EOS
OUTPUT2 = <<"EOS"
paiza
EOS

# 入力
s = gets.chomp

# 判定
res = if s.include?("paiza")
    # paiza が含まれる
    "paiza"
  elsif s.match(/p[a|@|4][i|1|!][z|2][a|@|4]/)
    # leet 表記されている
    "leet"
  else
    # 該当しない
    "nothing"
  end

# 出力
puts res

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
英単語に含まれるアルファベットの一部を形の似た数字や記号で置き換えることを Leet といいます。
Leet はパスワードやユーザー名の作成の際に便利な手法の一つです。

paiza では、エゴサーチを強化するためにツイートの中に Leet 表記された paiza が含まれているかを判定するプログラムを作成することになりました。
ツイートの文章 S が与えられるので、ツイートに "paiza" が含まれる場合は "paiza", "paiza" が含まれず Leet 表記された "paiza" が含まれる場合は "leet",
どちらも含まれない場合は "nothing" と出力してください。

なお、"paiza" の leet 文字列は、"paiza" について以下の置き換えを 1 回以上おこなうことで得られる文字列をさすものとします。

・a -> 4 または a -> @
・i -> 1 または i -> !
・z -> 2

▼　下記解答欄にコードを記入してみよう

入力される値
S

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・S に "paiza" が含まれる場合は "paiza", "paiza" が含まれず Leet 表記された "paiza" が含まれる場合は "leet", どちらも含まれない場合は "nothing" と出力してください。

条件
・S はアルファベット小文字(a~z)・数字(0~9)・@・!からなる文字列
・1 ≦ |S| ≦ 100

入力例1
leetp@1za

出力例1
leet

入力例2
nopaizanostudy

出力例2
paiza
=end
