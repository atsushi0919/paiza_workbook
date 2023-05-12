# 配列（リスト）の重複カウント (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/sort_add_2

ary = ["HND", "NRT", "KIX", "NGO", "NGO", "NGO", "NGO", "NGO"]

# [解答例1]
len = ary.length
count = 1
(0..len - 1).each do |i|
  (i + 1..len - 1).each do |j|
    if ary[i] == ary[j]
      count += 1
    end
  end
  break if count > 1
end

puts count

# [解答例2]
sorted_ary = ary.group_by(&:itself).map { |k, v|
  [k, v.length]
}.sort_by { |k, v| v }.reverse
p sorted_ary[0][1]

# [解答例3]
sorted_ary = ary.tally.sort_by { |k, v| v }.reverse
puts sorted_ary[0][1]

=begin
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
指定された配列（リスト）の定義の中で、同じ要素の数をカウントして、その数を出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
なし

"HND", "NRT", "KIX", "NGO", "NGO", "NGO", "NGO", "NGO"
を要素に持つ配列（リスト）をプログラムで定義し、使用すること。
ただし、2つ以上同じ要素が出現するのは、1種類の文字列についてだけです。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
同じ要素の数をカウントして、その数を出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
なし
=end
