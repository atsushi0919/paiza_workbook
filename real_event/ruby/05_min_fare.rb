# 最小の運賃 (paizaランク A 相当)
# https://paiza.jp/works/mondai/real_event/min_fare

INPUT1 = <<~"EOS"
  5 5 3
  0 1 200
  0 4 500
  0 2 200
  1 4 200
  4 3 300
EOS
OUTPUT1 = <<~"EOS"
  700
EOS

INPUT2 = <<~"EOS"
  3 6 3
  0 1 200
  1 3 150
  2 4 100
EOS
OUTPUT2 = <<~"EOS"
  350
EOS

def solve(input_str)
  # ----------------------------------------
  # 入力受け取り
  # ----------------------------------------
  # 入力文字列を改行で分割する
  input_lines = input_str.chomp.split("\n")
  # e: 路線数, v: 駅数, t: 目的地
  e, v, t = input_lines.shift.split.map(&:to_i)
  # routes: 路線の情報
  routes = input_lines.map { |line| line.split.map(&:to_i) }

  # ----------------------------------------
  # route_map: 隣接リスト作成
  # ----------------------------------------
  route_map = Array.new(v) { [] }
  # st_a: 駅a, st_b: 駅b, fare: 運賃
  routes.each do |st_a, st_b, fare|
    # 駅a と 駅b は同じ運賃で行き来できる
    route_map[st_a] << [st_b, fare]
    route_map[st_b] << [st_a, fare]
  end

  # ----------------------------------------
  # 駅0 から 駅t までの最小運賃を求める
  # ----------------------------------------
  # スタート地点の情報[0: 運賃, 0: 駅番号]で search_list を初期化
  search_list = [[0, 0]]
  # 各駅までの最小運賃を nil で初期化
  min_fares = Array.new(v)
  # search_list が空になるまで繰り返す
  while not search_list.empty?
    # 合計運賃が最小の駅を取り出し現在駅とする
    # current_fare: 現在駅に着くための合計運賃
    # current_st: 現在駅番号
    current_fare, current_st = search_list.sort!.shift
    # 現在駅の最小運賃が確定済みならスキップ
    next if not min_fares[current_st].nil?
    # 現在駅を最小運賃で確定させる
    min_fares[current_st] = current_fare

    # 現在駅がゴールなら駅tまでの最小運賃を返す
    # (文字列に変換して末尾に改行を追加)
    if current_st == t
      return min_fares[t].to_s << "\n"
    end

    # 現在駅からの路線情報を順に調べる
    route_map[current_st].each do |next_st, next_fare|
      # 次の駅の最小運賃が確定済みならスキップ
      next if not min_fares[next_st].nil?
      # search_list に次の駅のまでの運賃と駅番号を追加
      search_list << [current_fare + next_fare, next_st]
    end
  end
end

puts solve(STDIN.read)