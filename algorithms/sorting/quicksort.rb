def quick_sort(array)
  if array.length <= 1
    return array
  else
    pivot = array[0]
    left = []
    right =[]
    array.delete_at(0)
    array.each do |n|
      n <= pivot ? left.push(n) : right.push(n)
    end
     quick_sort(left) + [pivot] + quick_sort(right)
  end
end
