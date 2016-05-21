require_relative 'sorter'
require_relative 'i_sort'

def bucket_sort(ar)
  n = ar.length
  buckets = Array.new(n){ [] }
  for i in 0...n
    k = bucket_hash(ar[i])
    buckets[k] << ar[i]
  end
  extract(buckets, ar)
end

def bucket_hash(num)
  num / 3
end

def extract(buckets, ar)
  idx = 0
  n = ar.length
  for i in 0...n do
    buckets.each{ |bucket| insertion_sort(bucket) }
    for j in 0...buckets[i].length do
      ar[idx] = buckets[i][j]
      idx += 1
    end
  end
end

Sorter::run(true, 100) do |ar, __left, __right|
  bucket_sort(ar)
end
