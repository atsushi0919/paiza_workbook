# 配列のソート (paizaランク D 相当)
# https://paiza.jp/works/mondai/prob60/sort_add_3

ary = [1, 3, 5, 6, 3, 2, 5, 23, 2]

# [解答例1]
sorted_ary = []
ary.each do |t_n|
  inserted = false
  sorted_ary.each_with_index do |a_n, idx|
    if t_n < a_n
      sorted_ary.insert(idx, t_n)
      inserted = true
      break
    end
  end
  sorted_ary << t_n if not inserted
end
puts sorted_ary

# [解答例2]
puts ary.sort

=begin
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
指定した配列を定義し、配列の要素を昇順に並び替えて、全て出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
なし

1, 3, 5, 6, 3, 2, 5, 23, 2
を要素に持つ配列をプログラムで定義し、使用すること。


入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
昇順に並び替えて、1要素ごとに改行して出力してください。
最後は改行し、余計な文字、空行を含んではいけません。

条件
なし
=end
