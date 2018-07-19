def binary_search_iter(array, value)
  low = 0
  high = array.length - 1

  while low < high || low == high
    mid = (low + high) / 2
    if array[mid] > value
      high = mid - 1
    elsif array[mid] < value
      low = mid + 1
    else
      return mid
    end
  end
  return "cant seem to find what your looking for"
end
