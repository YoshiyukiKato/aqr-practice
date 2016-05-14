def partition(ar, left, right, pivot_index)
  pivot = ar[pivot_index] 
  ar[right], ar[pivot_index] = ar[pivot_index], ar[right] 

  anchor = left
  for idx in left...right do
    if ar[idx] < pivot
      ar[idx], ar[anchor] = ar[anchor], ar[idx]
      anchor += 1
    end
  end

  ar[right], ar[anchor] = ar[anchor] , ar[right]
  anchor
end


def select_kth_tr(ar, k, left, right)
  pivot_index = select_pivot_index(left, right)
  anchor = partition(ar, left, right, pivot_index) 
  
  if left + k - 1 == anchor
    # leftからk個(left+k)、にpivotになる要素分(-1)を考慮して、anchorと等しいなら
    anchor
  elsif left + k - 1 < anchor
    # anchorの方が大きいなら、探索範囲を右側から狭める必要がある
    # [left...left+k-1...anchor...right]
    # -> [left...left+k-1...anchor-1]
    # [left...left+k-1...anchor-1]
    next_k = k
    next_left = left
    next_right = anchor - 1
    select_kth_tr(ar, next_k, next_left, next_right)
  else
    # anchorの方が小さいなら、探索範囲を左側から狭める必要がある
    # [left...anchor...left+k-1...right]
    # -> [anchor+1...(k+left)...right]
    # -> [anchor+1...(k+left-1)-anchor...right]
    next_k = (k + left - 1) - anchor
    next_left = anchor + 1
    next_right = right
    select_kth_tr(ar, next_k, next_left, next_right)
  end
end

def select_pivot_index(left, right)
  (right + left + 1) / 2
end

def median_sort (ar, left, right)
  if right <= left
    ar
  else
    mid = (right - left + 1) / 2
    select_kth_tr(ar, mid, left, right)
    median_sort(ar, left, left+mid-1)
    median_sort(ar, left+mid+1, right)
  end
end

ar = [2,4,1,5,3,7,6,9,8]
left = 0
right = 8
p "before:#{ar}"
median_sort(ar, left, right) 
p "after:#{ar}"
