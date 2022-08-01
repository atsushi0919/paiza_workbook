# シミュレーション (paizaランク C 相当)
# https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_simulation_boss

INPUT1 = <<~"EOS"
  7
EOS

OUTPUT1 = <<~"EOS"
  4
EOS

INPUT2 = <<~"EOS"
  35
EOS
OUTPUT2 = <<~"EOS"
  6
EOS

=begin
def solve(input_line)
  # 標準入力の受け取り
  h = input_line.to_i

  # 初期設定
  count = 0
  paiza, monster = [], []

  # h が0を超えている間繰り返す
  while h > 0
    count += 1
    # 2回目までは攻撃は1
    if count < 3
      paiza << 1
      monster << 1
    else
      # [count - 2] -> 前回の攻撃
      # [count - 3] -> 前々回の攻撃
      paiza << monster[count - 2] + monster[count - 3]
      monster << paiza[count - 2] * 2 + paiza[count - 3]
    end
    # [count - 1] -> 今回の攻撃
    h -= monster[count - 1]
  end
  # 文字列型に変換して末尾に改行を追加する
  count.to_s << "\n"
end

puts solve(STDIN.read)
=end

def solve(input_line)
  h = input_line.to_i

  # 2回目で初期化
  count = 2
  paiza, monster = [1, 1], [1, 1]
  h -= 2

  while h > 0
    count += 1
    # paiza[1], monster[1] -> 前回の攻撃
    # paiza[0], monster[0] -> 前々回の攻撃
    p_atack = monster[1] + monster[0]
    m_atack = paiza[1] * 2 + paiza[0]

    # paiza, monster を上書きする
    paiza = [paiza[1], p_atack]
    monster = [monster[1], m_atack]
    h -= m_atack
  end
  count.to_s << "\n"
end

puts solve(STDIN.read)

=begin
h = gets.to_i
count = 0
paiza, monster = [1], [1]

while h > 0
  count += 1
  if count <= 2
    paiza << 1
    monster << 1
  else
    paiza << monster[count - 1] + monster[count - 2]
    monster << paiza[count - 1] * 2 + paiza[count - 2]
  end
  h -= monster[count]
end

puts count
=end
=begin
シミュレーション (paizaランク C 相当)
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:
https://paiza.jp/works/mondai/c_rank_level_up_problems/c_rank_simulation_boss
問題文のURLをコピーする
Img 04 03 下記の問題をプログラミングしてみよう！
カウンター魔法を得意とするパイザ君は、同じくカウンター魔法を使うモンスターと戦っています。
バトルはターン制で、パイザ君が先攻で、パイザ君とモンスターで交互に魔法を使い合います。
パイザ君の魔法は 1 回目と 2 回目に使うときにはダメージ 1 ですが、
 3 回目以降の n 回目には、

 (モンスターから受けた (n - 1) 回目の攻撃のダメージ) + (モンスターから受けた (n - 2) 回目の攻撃のダメージ) 

 のダメージを与えます。
 モンスターの魔法はこれよりも強力で、 1 回目と 2 回目には同じくダメージ 1 ですが、 
 3 回目以降の n 回目には、

 (パイザ君から受けた (n - 1) 回目の攻撃のダメージ) * 2 + (パイザ君から受けた (n - 2) 回目の攻撃のダメージ) 

 のダメージを与えます。

パイザ君は自分がどれくらいモンスターの攻撃を耐えられるか知りたいと思っています。
パイザ君の体力を H として、両者が同じ魔法を使い続けたとき、
モンスターの何回目の攻撃でパイザ君の体力が 0 以下になるかを出力してください。

▼　下記解答欄にコードを記入してみよう

入力される値
入力は以下のフォーマットで与えられます。

H

1 行目にパイザ君の体力を表す整数 H が与えられます。

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
モンスターの何回目の攻撃でパイザ君の体力が 0 以下になるかを出力してください。
末尾に改行を入れ、余計な文字、空行を含んではいけません。

条件
すべてのテストケースにおいて、以下の条件をみたします。

3 ≤ H ≤ 10^8

入力例1
7

出力例1
4

入力例2
35

出力例2
6
=end
