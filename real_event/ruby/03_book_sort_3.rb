# 本の整理 (paizaランク A 相当)
# https://paiza.jp/works/mondai/real_event/book_sort

INPUT1 = <<~"EOS"
  5
  5 4 3 2 1
EOS
OUTPUT1 = <<~"EOS"
  2
EOS

INPUT2 = <<~"EOS"
  10
  8 7 9 1 5 6 2 10 4 3
EOS
OUTPUT2 = <<~"EOS"
  6
EOS

INPUT3 = <<~"EOS"
  15
  8 5 10 6 4 11 12 3 9 1 13 2 15 14 7
EOS
OUTPUT3 = <<~"EOS"
  10
EOS

class PriorityQueue
  def initialize(elements: [], key: 0)
    @data = []
    @key = key
    elements.each { |element| insert(element) }
  end

  def insert(element)
    @data << element
    up_heap
  end

  def extract
    tgt_element = @data.shift
    if size > 0
      @data.unshift(@data.pop)
      down_heap
    end
    tgt_element
  end

  def size
    @data.length
  end

  private

  def swap(a, b)
    @data[a], @data[b] = @data[b], @data[a]
  end

  def parent_idx(idx)
    idx / 2 + idx % 2 - 1
  end

  def lt_child_idx(idx)
    (idx * 2) + 1
  end

  def rt_child_idx(idx)
    (idx * 2) + 2
  end

  def has_child?(idx)
    ((idx * 2) + 1) < size
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
      l_idx = lt_child_idx(idx)
      r_idx = rt_child_idx(idx)
      if @data[r_idx].nil?
        tgt_idx = l_idx
      else
        tgt_idx = @data[l_idx][@key] <= @data[r_idx][@key] ? l_idx : r_idx
      end
      if @data[idx][@key] > @data[tgt_idx][@key]
        swap(idx, tgt_idx)
        idx = tgt_idx
      else
        return
      end
    end
  end
end

n, *books = STDIN.read.split.map(&:to_i)

q = PriorityQueue.new
books.each_with_index do |id, i|
  q.insert([id, i])
end

count = 0
memo = {}
0.upto(n - 1) do |i|
  minId, minIdx = q.extract
  minIdx = memo[minId] if memo[minId]

  # swap
  if books[i] > minId
    memo[books[i]] = minIdx
    tmp = books[minIdx]
    books[minIdx] = books[i]
    books[i] = tmp

    count += 1
  end
end

puts count