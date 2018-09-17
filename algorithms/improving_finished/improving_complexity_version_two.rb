# Improving time and space
#donehope

def betteralgo(array)
  heapify(array.flatten!)
  array
end

def heapify(array)
  starter = array.length-1
  p array.length-1
  while starter >= 0
    shift(array, starter, array.length-1 )
    starter -= 1
  end
  return array
end

def shift(array, starter, ender)
  root = starter
  loop do
    child = root + 1
    break if child > ender
    if array[root] > array[child]
      array[root], array[child] = array[child], array[root]
      root = child
      else
      break
      return
    end
  end
end

arr = [[1,4,3],[2,5,6],[-1,44,5,32,44]]
p sorted_array = betteralgo(arr)
