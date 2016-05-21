require_relative 'sorter'

def insertion_sort(ar)
  n = ar.length
  for i in 1...n do
    tmp = ar[i] #i番目の要素が
    if tmp < ar[i-1] #もしi-1番目の要素よりも小さいならば
      j = i #カウンタjをi番目にセットして
      while j > 0 && ar[j-1] > tmp #jが0より大きく、なおかつj-1番目の要素がtmp(ar[i])よりも大きい間
        ar[j] = ar[j-1] #j番目の要素とj-1番目の要素を交換する
        j -= 1 #1セット終わったら、jの値を一つ下げる
      end
      ar[j] = tmp #最後に、tmpにとっておいたもとのi番目の値（ar[i]）をループが終わったj番目の位置に入れる
    end
  end
end

Sorter::run(true, 100) do |ar, __left, __right|
  insertion_sort(ar)
end
