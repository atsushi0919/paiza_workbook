# 十億連勝 (paizaランク S 相当)
# https://paiza.jp/works/mondai/real_event/continuous_winsning

INPUT1 = <<~"EOS"
  3 4
  3
  2
  3
EOS
OUTPUT1 = <<~"EOS"
  7
EOS

INPUT2 = <<~"EOS"
  5 1
  1
  1
  1
  1
  1
EOS
OUTPUT2 = <<~"EOS"
  12
EOS

def solve(input_str)
  # 下9桁表示用
  d = 1_000_000_000
  # -----------------------------------
  # 入力受け取り
  # -----------------------------------
  # n: ステージ数, x: ボーナス条件, game_sets: 試合のセット数
  n, x, *game_sets = input_str.split.map(&:to_i)

  # -----------------------------------
  # state_table: 連勝状態の表を作成・更新する
  # -----------------------------------
  # state_table 初期化
  # キー: [連勝数, ボーナスフラグ], 値: この状態になっている数
  state_table = { [0, false] => 1 }

  # ステージ分 繰り返す
  game_sets.each do |games|
    # 試合がない場合スキップ
    next if games == 0

    # 新しい状態の初期値を 0 に設定
    states = Hash.new(0)
    # 前回のゲーム終了時の連勝状態を先頭から順に参照する
    # wins: 連勝数, flag: ボーナスフラグ, count: カウント
    state_table.each do |(wins, flag), count|
      # 連勝数x未満で負けのパターン
      states[[0, flag]] += count * [games, x - wins].min

      if games > x - wins
        # ボーナスを満たして負けるパターン
        states[[0, true]] += count
      else
        # 連勝で終わるパターン
        states[[wins + games, flag]] += count
      end
    end
    # state_table を上書きする
    state_table = states
  end
  # -----------------------------------
  # bonus: 隠しステージが出現する状態を集計する
  # -----------------------------------
  bonus = 0
  # ボーナス発生パターンを集計
  state_table.each do |(wins, flag), count|
    bonus += count if flag || wins == x
  end
  # ボーナス発生パターンの下9桁を返す
  (bonus % d).to_s << "\n"
end

puts solve(STDIN.read)
