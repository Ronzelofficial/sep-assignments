def binary_search_rec(array, low, high, value)
  if high > low
    mid = (low + (high - 1)) / 2
    if array[mid] == value
      return mid
    elsif array[mid] > value
      return binary_search_rec(array, low, mid-1, value)
    else
      return binary_search_rec(array, low+1, high, value)
    end
  else
    return "shes not there :("
  end
end
