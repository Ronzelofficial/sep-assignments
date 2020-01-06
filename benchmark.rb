require 'benchmark'
require_relative 'binary_search_tree/binary_search_tree'
require_relative 'min_heap/min_heap'

root = Node.new("1", 1)
tree = BinarySearchTree.new(root)
heap = MinBinaryHeap.new(root)

Benchmark.bm do |x|
  x.report("Tree insert:  ") { n = 1; 100_00.times do; node = Node.new("#{n}", n); n += 1; tree.insert(root, node); end }
  x.report("Heap insert:  ") { n = 1; 100_00.times do; node = Node.new("#{n}", n); n += 1; heap.insert(node); end }
  # x.report("Tree print:   ") { tree.printf }
  # x.report("Heap print:   ") { heap.printf }
  x.report("Tree find:    ") { tree.find(root, "5000") }
  x.report("Heap find:    ") { heap.find("5000") }
  x.report("Tree delete:  ") { tree.delete(root, "5000") }
  x.report("Heap delete:  ") { heap.delete("5000") }
end
