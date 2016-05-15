require_relative './sorter'


def quick_sort(ar, left, right)
  if left < right
    pi = partition(ar, left, right)
    quick_sort(ar, left, pi - 1)
    quick_sort(ar, pi + 1, right)
  end
end

def partition(ar, left, right)
  pivot = left + rand(right - left) #ランダムにpivotを選ぶ
  ar[pivot], ar[right] = ar[right], ar[pivot] #pivotの値と右端の値をswapする
  anchor = left #アンカーポイントを左端に設定
  for i in left...right do
    if ar[i] <= ar[right] #もし、pivotの値（rightにswap済み）よりも小さいなら
      ar[i], ar[anchor] = ar[anchor], ar[i] #anchorの値とiの値をswap
      anchor += 1 #anchorの位置を一つ動かす
    end
  end
  ar[anchor], ar[right] = ar[right], ar[anchor]
  anchor
end

# test
Sorter::run do |ar, left, right|
  quick_sort(ar, left, right)
end
