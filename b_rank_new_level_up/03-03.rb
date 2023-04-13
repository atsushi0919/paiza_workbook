# 【条件判定 3】過剰コンプライアンス (paizaランク B 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__over_conpriance

INPUT1 = <<"EOS"
5
paiza
paaaa
paiza
paisa
zaiza
ab
EOS
OUTPUT1 = <<"EOS"
paaaa
banned
xxxsa
zaxxx
ab
EOS

INPUT2 = <<"EOS"
1
ab
abababa
EOS
OUTPUT2 = <<"EOS"
abababa
EOS

INPUT3 = <<"EOS"
2
cysy
cyqi
mlvh
EOS

# 入力
_, s, *v = $stdin.read.split("\n")

# 禁止語判定用の設定
mid = s.length.quo(2).ceil    # 中央
b_word_head = s[...mid]       # 前半
b_word_tail = s[-mid..]       # 後半
blank_str = "x" * mid         # 伏字用
# 文字列の判定
results = v.map do |word|
  if word == s
    # word が禁止語と一致する場合
    "banned"
  elsif word.length == s.length
    # 文字数が同じ場合
    word_head = word[...mid]   # 前半
    word_tail = word[-mid..]   # 後半

    if word_head == b_word_head
      # 禁止語の前半と一致する場合 前半を伏字に書き換え
      word[...mid] = blank_str
    elsif word_tail == b_word_tail
      # 禁止後の後半と一致する場合 後半を伏字に書き換え
      word[-mid..] = blank_str
    end
    word
  else
    # 文字数が違えば そのまま
    word
  end
end

# 出力
puts results.join("\n")

=begin
君主の paiza 国王によって情報統制が厳しくなった paiza 国では、今回新たに使用禁止用語の検閲についての次のような法律ができました。

今後、放送禁止単語 S と文字数が同じで、前半分または後ろ半分が同じ文字である単語 V を放送する時は、
放送禁止用語と重なっている部分（前半分または後ろ半分）の文字を全て x で置き換えた単語を放送する。

また、V が放送禁止用語と完全に一致する場合は V を放送せず、代わりに "banned" と出力する。

放送禁止用語 S と N 個の放送したい単語 V_1, ..., V_N が与えられるので、検閲をおこなった後の V_1, ..., V_N を出力してください。

例として、S = math, V_1 = main, V_2 = programming, V_3 = memo, V_4 = paiza の場合は、
検閲後の各単語は xxin, programming, memo, paiza となります。

S_i の文字数が奇数の場合は、文字列の前半と後半に中央の文字が含まれることに注意してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N
S
V_1
...
V_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
検閲を行った後の V_1, ..., V_N を改行区切りで出力してください。

条件
・1 ≦ N ≦ 10
・1 ≦ |S| ≦ 100
・1 ≦ |V_i| ≦ 100 (1 ≦ i ≦ N)
・S,V_i はアルファベット小文字のみからなる文字列である。

入力例1
5
paiza
paaaa
paiza
paisa
zaiza
ab

出力例1
paaaa
banned
xxxsa
zaxxx
ab

入力例2
1
ab
abababa

出力例2
abababa
=end
