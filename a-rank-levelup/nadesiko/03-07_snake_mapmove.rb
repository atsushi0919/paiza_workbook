# https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_snake_mapmove_boss
# へび (paizaランク A 相当)

exec "cnako3", "-e", <<敬具

●（入力文字列の）メイン処理とは
　　入力行配列＝入力文字列をトリムして改行で区切る
　　Ｈ、Ｗ、現在Ｙ、現在Ｘ、Ｎ＝入力行配列の０から１を配列取り出しして「 」で区切る

　　# 盤面情報の二次元配列を作成
　　盤面配列＝入力行配列の０からＨを配列取り出しする
　　行番号で０からＨ－１まで繰り返す
　　　　盤面配列【行番号】＝盤面配列【行番号】を「」で区切る
　　ここまで

　　# 旋回するタイミングの表を作成
　　旋回時刻表＝｛｝
　　入力で入力行配列を反復する
　　　　時刻、方向＝入力を「 」で区切る
　　　　旋回時刻表＠時刻＝方向
　　ここまで

　　# （↓Ｙ →Ｘ）０：北、１：東、２：南、３：西
　　ベクトル＝【【－１、０】、【０、１】、【１、０】、【０、－１】】
　　ベクトル数＝ベクトルの配列要素数
　　# へびを初期設定して盤面配列に置く
　　現在方向＝０
　　盤面配列【現在Ｙ】【現在Ｘ】＝「*」
　　# 移動処理
　　現在時刻で０から９９まで繰り返す
　　　　＃旋回ありの時刻なら旋回処理
　　　　もし（旋回時刻表＠現在時刻＝「L」）ならば、現在方向を１減らす
　　　　もし（旋回時刻表＠現在時刻＝「R」）ならば、現在方向を１増やす
　　　　現在方向＝（現在方向＋ベクトル数）％ベクトル数
　　　　# 移動先確認
　　　　移動量Ｙ＝ベクトル【現在方向】【０】
　　　　移動量Ｘ＝ベクトル【現在方向】【１】
　　　　次Ｙ＝現在Ｙ＋移動量Ｙ
　　　　次Ｘ＝現在Ｘ＋移動量Ｘ
　　　　# 盤面外ならループ終了
　　　　もし（次Ｙ＜０）または（次Ｙ＞＝Ｈ）ならば、抜ける
　　　　もし（次Ｘ＜０）または（次Ｘ＞＝Ｗ）ならば、抜ける
　　　　# 障害物ならループ終了
　　　　もし（盤面配列【次Ｙ】【次Ｘ】＝「#」）ならば、抜ける
　　　　もし（盤面配列【次Ｙ】【次Ｘ】＝「*」）ならば、抜ける
　　　　
　　　　# 現在位置と盤面配列更新
　　　　現在Ｙ＝次Ｙ
　　　　現在Ｘ＝次Ｘ
　　　　盤面配列【現在Ｙ】【現在Ｘ】＝「*」
　　ここまで

　　# 二次元配列を文字列に変換する
　　結果行配列＝【】
　　盤面行で盤面配列を反復する
　　　　盤面行を「」で配列結合して、それを結果行配列に配列追加する
　　ここまで
　　結果行配列を改行で配列結合して戻す
ここまで

拝啓
「/dev/stdin」から開いて入力文字列に代入してください。
入力文字列のメイン処理を表示してください。お願いします。
敬具
