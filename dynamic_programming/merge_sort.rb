def merge_sort(ary)
  # 要素が 1 個になるまで分割する
  al = ary.length
  return ary if al == 1

  mid = al / 2
  ary_l = merge_sort(ary[..mid - 1])
  ary_r = merge_sort(ary[mid..])

  # 分割した要素をマージする
  sorted_ary = []
  while ary_l.length > 0 || ary_r.length > 0
    sorted_ary <<
    if ary_l.length == 0
      ary_r.shift
    elsif ary_r.length == 0
      ary_l.shift
    elsif ary_l[0] > ary_r[0]
      ary_r.shift
    else
      ary_l.shift
    end
  end
  sorted_ary
end

p merge_sort([8, 5, 9, 2, 6, 3, 7, 1, 4])
# > [1, 2, 3, 4, 5, 6, 7, 8, 9]
