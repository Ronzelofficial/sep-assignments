#done
require 'benchmark'
require_relative './quicksort.rb'
require_relative './heapsort.rb'
require_relative './bucketsort.rb'

array_one = [1..1000000].shuffle

Benchmark.bm(10) do |x|
  x.report("quick_sort") { quick_sort(array_one) }
  x.report("heap_sort") { heap_sort(array_one) }
  x.report("bucket_sort") { bucket_sort(array_one) }
end
