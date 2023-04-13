# 【条件判定 2】視力検査 (paizaランク C 相当)
# https://paiza.jp/works/mondai/b_rank_new_level_up_problems/b_rank_new_level_up_problems__vision_test

INPUT1 = <<"EOS"
4
TA ok
TA ng
TA ng
TA ok
EOS
OUTPUT1 = <<"EOS"
E
EOS

INPUT2 = <<"EOS"
4
TB ok
TC ok
TC ok
TB ok
EOS
OUTPUT2 = <<"EOS"
B
EOS

INPUT3 = <<"EOS"
6
TD ng
TD ok
TD ng
TA ng
TA ok
TA ok
EOS

# _, *t = INPUT2.split("\n")

# 入力
_, *t = $stdin.read.split("\n")

# 検査結果記録用
test_results = { "TA" => [], "TB" => [], "TC" => [], "TD" => [] }
# 検査結果集計
t.each do |test_result|
  type, judge = test_result.split
  test_results[type] << judge
end

# 視力判定
eyesight = "E"
test_results.reverse_each do |test_type, results|
  pass, failure = false
  results.each do |result|
    if result == "ok"
      if pass
        # 2回目の正解なら このレベルの検査は合格とする
        eyesight = test_type[1]
        break
      else
        # 1回目の正解なら pass フラグを立てて検査続行
        pass = true
      end
    else
      if failure
        # 2回目の不正解なら このレベルの検査は不合格とする
        break
      else
        # 1回目の不正解な failure フラグを立てて検査続行
        failure = true
      end
    end
  end
end

# 出力
puts eyesight

=begin
問題にチャレンジして、ユーザー同士で解答を教え合ったり、コードを公開してみよう！

シェア用URL:

問題文のURLをコピーする
 下記の問題をプログラミングしてみよう！
定期検診の一環として視力検査をおこなうことになりました。
そこで、保健委員の paiza 君はクラスの視力検査の手伝いをすることになりました。
視力検査の概要は次の通りです。

・視力を良い方から順に A, B, C, D, E の 5 段階で判定します。
・各段階の視力であることを検査するためのテスト TA, TB, TC, TD が用意されており、
paiza 君がこれらのうちのいずれかを被験者に見せ、被験者が正しく解答した場合を「成功」、正しく解答できなかった場合を「失敗」とします。
・同じ段階のテストに 2 回失敗する前に 2 回成功した場合、その段階について「合格」、それ以外の場合を「不合格」とします。
・合格した段階のうち、最も良い段階をその被験者の視力として判定します。
・どのレベルのテストにも合格しなかった場合、被験者の視力は E として扱います。


ある被験者に対しておこなったテストとその結果が与えられるので、被験者の視力を判定してください。

▼　下記解答欄にコードを記入してみよう

入力される値
N
T_1 J_1
...
T_N J_N

入力値最終行の末尾に改行が１つ入ります。
文字列は標準入力から渡されます。 標準入力からの値取得方法はこちらをご確認ください
期待する出力
・被験者の視力(A ~ E)を 1 行で出力してください。

条件
・1 ≦ N ≦ 20
・T_i は TA, TB, TC, TD
・J_i は "ok" か "ng" のいずれかであり、"ok" が成功であることを、 "ng" が失敗であることを表しています。

入力例1
4
TA ok
TA ng
TA ng
TA ok

出力例1
E

入力例2
4
TB ok
TC ok
TC ok
TB ok

出力例2
B
=end
