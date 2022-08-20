# グラフの s,t トレイル (paizaランク B 相当)
# https://paiza.jp/works/mondai/graph_dfs_problems/graph_dfs__trail_one_step2

INPUT1 = """\
5 1 4
2
2 5
3
1 3 5
3
2 4 5
2
3 5
4
1 2 3 4
"""
OUTPUT1 = """\
1 5 3 2 5 4
"""

INPUT2 = """\
5 5 3
2
2 5
3
1 3 5
3
2 4 5
2
3 5
4
1 2 3 4
"""
OUTPUT2 = """\
5 1 2 3
"""

INPUT3 = """\
7 6 4
6
2 3 4 5 6 7
6
1 3 4 5 6 7
6
1 2 4 5 6 7
6
1 2 3 5 6 7
6
1 2 3 4 6 7
6
1 2 3 4 5 7
6
1 2 3 4 5 6
"""
OUTPUT3 = """\
6 3 2 5 1 7 2 1 3 5 7 3 4
"""


class Trail:
    def __init__(self, nodes, edges):
        self.nodes = nodes
        self.edges = edges


def main(input_str):
    input_lines = input_str.splitlines()
    # n: 頂点数, s: 起点, t: 終点
    n, s, t = map(int, input_lines[0].split())
    # 隣接リスト
    ad_list = {}
    for (i, line) in enumerate(input_lines[1:], 1):
        if i % 2 != 0:
            continue
        ad_list[i // 2] = list(map(int, line.split()))

    # s から t への経路
    results = []
    edges = [[False for w in range(n + 1)] for h in range(n + 1)]
    trails = [Trail([s], edges)]
    while len(trails) > 0:
        trail = trails.pop()
        # t に着いたら経路を記録
        if trail.nodes[-1] == t:
            results.append(trail.nodes)
            continue

        # 隣接頂点に移動する
        cv = trail.nodes[-1]
        for nv in ad_list[cv]:
            # 使ったことのある経路ならスキップ
            if trail.edges[cv][nv]:
                continue
            if trail.edges[nv][cv]:
                continue
            # s は再訪問しない
            if nv == s:
                continue

            # 新しい trail を trails に追加
            nodes = trail.nodes + [nv]
            edges = [e.copy() for e in trail.edges]
            edges[cv][nv] = True
            edges[nv][cv] = True
            trails.append(Trail(nodes, edges))

    # s から t に行ける経路を頂点数で昇順ソート
    results.sort(key=lambda x: len(x))
    # 頂点数が最も多い経路から 1 つ出力
    return " ".join(map(str, results[-1]))


# print(main(open(0).read()))
print(main(INPUT1))

'''
Trail = Struct.new(:nodes, :edges)

def main(input_str)
  input_lines = input_str.split("\n")
  # n: 頂点数, s: 起点, t: 終点
  n, s, t = input_lines.shift.split.map(&:to_i)
  # 隣接リスト
  ad_list = {}
  input_lines.each.with_index(1) do |line, i|
    next if i.odd?
    ad_list[i / 2] = line.split.map(&:to_i)
  end

  # s から t への経路を調べる
  results = []
  trails = [Trail.new([s], [])]
  while trails.length > 0
    trail = trails.pop
    if trail.nodes.last == t
      results << trail.nodes
      next
    end
    # 隣接頂点を調べる
    cv = trail.nodes.last
    ad_list[cv].each do |nv|
      e = [cv, nv].sort
      # 使ったことのある経路ならスキップ
      next if trail.edges.include?(e)
      # s は再訪問しない
      next if nv == s

      # trail を複製して情報更新
      new_trail = Marshal.load(Marshal.dump(trail))
      new_trail.nodes << nv
      new_trail.edges << e
      trails << new_trail
    end
  end
  # 頂点数が最も多い経路から 1 つ出力
  results.sort { |a, b| a.length <=> b.length }.last.join(" ")
end

puts main(STDIN.read)
'''
