require_relative 'sorter'

def heap_sort(ar, __left, __right)
  build_heap(ar)
  n = ar.length
  idx_list = (1..(n-1)).to_a.reverse
  for i in idx_list do
    ar[0], ar[i] = ar[i], ar[0] #0番目とi番目をswap
    heapify(ar, 0, i)
  end
end

def build_heap(ar)
  n = ar.length
  idx_list = (0..(n/2-1)).to_a.reverse
  for i in idx_list do
    heapify(ar, i, n)
  end
end

def heapify(ar, idx, max)
  left = 2 * idx + 1 #leftはidxの左側の子要素
  right = 2 * idx + 2 #rightはidxの右側の子要素
  if left < max and ar[left] > ar[idx] #leftがmaxより小さく、leftの値がidxの値よりも大きいなら
    largest = left #この段階で最も大きいのはleft
  else #それ以外
    largest = idx #この段階で最も大きいのはidx
  end

  if right < max and ar[right] > ar[largest] #rightがmaxより小さく、rightの値がleftとidxのうち大きい方より大きいなら
    largest = right #この段階で最も大きいのはright
  end
  
  if largest != idx #最も大きいのがidxじゃないなら
    ar[idx], ar[largest] = ar[largest], ar[idx] #idxとlargestの位置をswap
    heapify(ar, largest, max)
  end
end


Sorter::run(true, 100) do |ar, __left, __right|
  heap_sort(ar, __left, __right)
end
