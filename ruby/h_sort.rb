require_relative 'sorter'

def heap_sort(ar, __left, __right)
  build_heap(ar) #配列をヒープ化
  n = ar.length
  idx_list = (1..(n-1)).to_a.reverse #indexをn-1..1まで並べる（逆順）
  for i in idx_list do
    #ヒープ化された二分木の頂上から、要素を一つずつ落としていって適切な位置にいれていく
    #0番目とi番目をswapして、heapifyする
    ar[0], ar[i] = ar[i], ar[0] 
    heapify(ar, 0, i)#0番目とi番目を入れ替えた場合、ヒープとしての順序が保証されていないのは0~i番目までなので、対象範囲の端はi
  end
end

def build_heap(ar)
  n = ar.length
  idx_list = (0..(n/2-1)).to_a.reverse #n/2-1..0までのindexを逆順に並べる
  for i in idx_list do
    heapify(ar, i, n)
  end
end

def heapify(ar, idx, max)
  left = 2 * idx + 1 #leftはidxの左側の子要素
  right = 2 * idx + 2 #rightはidxの右側の子要素
  # idx, left, rightの値のなかで最大のものを特定する
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
