# 重複の判定 (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/sort_add_1

ary = ["HND", "NRT", "KIX", "NGO", "NGO"]

# [解答例1]
len = ary.length
duplicate = false
(0..len - 1).each do |i|
  (i + 1..len - 1).each do |j|
    if ary[i] == ary[j]
      duplicate = true
      break
    end
  end
  break if duplicate
end

if duplicate
  puts "true"
else
  puts "false"
end

# [解答例2]
hash = ary.group_by(&:itself).map { |key, val|
  [key, val.length]
}.to_h
puts hash.values.max > 1 ? "true" : "false"

# [解答例3]
puts ary.tally.values.max > 1 ? "true" : "false"

=begin
指定された配列（リスト）の定義の中で、同じ値が存在した場合はtrueを、そうでない場合はfalseを出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
なし

HND, NRT, KIX, NGO, NGO
を要素に持つ配列（リスト）をプログラムで定義し、使用すること。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
配列（リスト）の要素に重複があればtrueを、重複がなかったらfalseを出力する。
最後は改行し、余計な文字、空行を含んではいけません。

条件
なし
=end
