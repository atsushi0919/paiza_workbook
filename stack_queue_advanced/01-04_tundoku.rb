# 積読 (paizaランク B 相当)
# https://paiza.jp/works/mondai/stack_queue_advanced/stack_queue_advanced__tundoku

INPUT1 = <<~"EOS"
  3
  buy_book 10
  buy_book 15
  read 10
EOS
OUTPUT1 = <<~"EOS"
  2
  15
EOS

INPUT2 = <<~"EOS"
  5
  buy_book 100
  buy_book 100
  buy_book 200
  read 240
  read 80
EOS
OUTPUT2 = <<~"EOS"
  1
  80
EOS

_, *Q = $stdin.read.split("\n")

stack = []
Q.each do |req|
  ope, page = req.split
  page = page.to_i

  case ope
  when "buy_book"
    stack.push(page)
  when "read"
    while page > 0
      unread = stack.pop
      if unread > page
        unread -= page
        page = 0
        stack.push(unread)
      else
        page -= unread
      end
    end
  end
end

puts [stack.length, stack.sum].join("\n")

=begin
paiza 君は、最近新たなプログラミング言語を習得するために学習本を買い漁って読んでいました。
整理整頓が苦手な paiza 君は買った本を 1 箇所にどんどん積み重ねてしまいます。
また、本を読むときは間から本を取るのが面倒なので、一番上に置かれている本の読んでいないページから読書を再開し、
全てのページを読み終わった本は山から取り除くことにしています。

どの本をどこまで読んだか忘れてしまった paiza 君は積まれている本のうち、まだ読んでいないページ数を数えたいと思いました。
paiza 君の行動の履歴が時系列順に以下のいずれかの形式で与えられるので、
全ての行動が終わった後に残っている本の冊数と未読の合計ページ数を求めてください。
なお、はじめ paiza 君は 1 冊も本を持っていないものとします。

・buy_book X
X ページの本を購入し、現在の本の山の一番上に置く。

・read Y
一番上の本の未読のページから数えて合計 Y ページ読む。
一番上の本が読み終わったら、その本を取り除き、一つ下の本の未読のページから読書を再開する。

▼　下記解答欄にコードを記入してみよう

入力される値
N
Q_1
Q_2
...
Q_N


・1 行目では与えられる paiza 君の行動の回数 N が与えられます。
・2 行目からの N 行では、paiza 君の行動の記録が時系列順に与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・山に残っている本の冊数 B と未読のページ数 P を改行区切りで出力してください。


B
P
条件
すべてのテストケースにおいて、以下の条件をみたします。

・1 ≦ N ≦ 10000
・Q_i は次のいずれかの形式
「buy_book X (1 ≦ X ≦ 10000)」
「read Y　(1 ≦ Y ≦ 積み上げられた本のページ数の総和)」
・読む本がなくなることがないことが保証されています。

入力例1
3
buy_book 10
buy_book 15
read 10

出力例1
2
15

入力例2
5
buy_book 100
buy_book 100
buy_book 200
read 240
read 80

出力例2
1
80
=end
