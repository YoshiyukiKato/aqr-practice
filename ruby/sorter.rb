require 'benchmark'

module Sorter
  def self.run(is_debug=false, sample_num=100000)
    ar = (1..sample_num).to_a.shuffle 
    left = 0
    right = ar.length - 1 
    
    puts "before: #{ar}" if is_debug
    result = Benchmark.realtime do
      yield(ar, left, right)
    end
    puts "after: #{ar}" if is_debug
    puts "処理時間： #{result}s"
  end
end
