#done

def heap_sort(array)
    heapify(array)
    return array
end

def heapify(array)
  starter = array.length-1
  p array.length-1
  while starter >= 0
    shift(array, starter, array.length-1 )
    starter -= 1
  end
end

def shift(array, starter, ender)
  root = starter
  loop do
    child = root + 1
    break if child > ender
    if array[root] < array[child]
      array[root], array[child] = array[child], array[root]
      root = child
      else
      break
    end
  end
end

array2 = [7,8,9,-7,5555555,2,45,67,3,2,2.3344,6,5,4,3,2].shuffle
p array2
heap_sort(array2)
