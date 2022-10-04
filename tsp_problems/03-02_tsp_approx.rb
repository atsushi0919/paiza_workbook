# 2-近似によるTSP (paizaランク A 相当)
# https://paiza.jp/works/mondai/tsp_problems/tsp_problems__tsp_approx

INPUT1 = <<~"EOS"
  4
  0 0
  2 2
  -1 1
  0 -2
EOS
OUTPUT1 = <<~"EOS"
  3 2 0 1
EOS

class PriorityQueue
  attr_reader :data

  def initialize(array = [], key = 0)
    @data = []
    @key = key
    array.each { |element| insert(element) }
  end

  def insert(element)
    @data << element
    up_heap
  end

  def extract
    target_element = @data.shift
    if size > 1
      @data.unshift @data.pop
      down_heap
    end
    target_element
  end

  def peek
    @data[0]
  end

  def size
    @data.size
  end

  private

  def swap(a, b)
    @data[a], @data[b] = @data[b], @data[a]
  end

  def parent_idx(idx)
    idx / 2 + idx % 2 - 1
  end

  def left_child_idx(idx)
    (idx * 2) + 1
  end

  def right_child_idx(idx)
    (idx * 2) + 2
  end

  def has_child?(idx)
    ((idx * 2) + 1) < @data.size
  end

  def up_heap
    idx = size - 1
    return if idx == 0
    parent_idx = parent_idx(idx)
    while @data[parent_idx][@key] > @data[idx][@key]
      swap(parent_idx, idx)
      return if parent_idx == 0
      idx = parent_idx
      parent_idx = parent_idx(idx)
    end
  end

  def down_heap
    idx = 0
    while (has_child?(idx))
      l_idx = left_child_idx(idx)
      r_idx = right_child_idx(idx)
      if @data[r_idx].nil?
        target_idx = l_idx
      else
        target_idx = @data[l_idx][@key] <= @data[r_idx][@key] ? l_idx : r_idx
      end
      if @data[idx][@key] > @data[target_idx][@key]
        swap(idx, target_idx)
        idx = target_idx
      else
        return
      end
    end
  end
end

def e_dist(x1, y1, x2, y2)
  ((x1 - x2) ** 2 + (y1 - y2) ** 2) ** 0.5
end

input_lines = STDIN.read.split("\n")
n = input_lines.shift.to_i
coords = input_lines.map { |l| l.split.map(&:to_i) }

ad_list = Array.new(n) { [] }
(0...n - 1).each do |i|
  (i + 1...n).each do |j|
    dist = e_dist(*coords[i], *coords[j])
    ad_list[i] << [j, dist]
    ad_list[j] << [i, dist]
  end
end

# 適当な頂点から始める
cv = rand(n)
visited_list = Array.new(n, false)
visited_list[cv] = true

pq = PriorityQueue.new
ad_list[cv].each do |nv, dist|
  pq.insert([dist, cv, nv])
end

mst = []
while visited_list.any?(false)
  dist, pv, cv = pq.extract

  next if visited_list[cv]
  mst << [pv, cv]
  visited_list[cv] = true

  ad_list[cv].each do |nv, dist|
    next if visited_list[nv]
    pq.insert([dist, cv, nv])
  end
end

mst_ad_list = Array.new(n) { [] }
mst_visited_list = Array.new(n, false)
mst.each do |a, b|
  mst_ad_list[a] << b
  mst_ad_list[b] << a
end

# 適当な辺から始める
route = mst.sample
mst_visited_list[route.first] = true
mst_visited_list[route.last] = true

while mst_visited_list.any?(false)
  # 先端または末端に追加できる頂点はあるか？
  sv = route.first
  ev = route.last
  add_vertex = false
  [sv, ev].each_with_index do |cv, i|
    nv = mst_ad_list[cv].find { |i| mst_visited_list[i] == false }
    # 追加できる頂点がある
    if nv
      i == 0 ? route.unshift(nv) : route.push(nv)
      mst_visited_list[nv] = true
      add_vertex = true
    end
  end
  # 追加できる頂点がない
  next if add_vertex
  pq = PriorityQueue.new(ad_list[ev].select { |v, d| not mst_visited_list[v] }, 1)
  nv = pq.extract[0]
  route.push(nv)
  mst_visited_list[nv] = true
end

puts route.join(" ")
