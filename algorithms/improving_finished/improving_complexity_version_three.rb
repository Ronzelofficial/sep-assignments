# Improving time and space
#donehope
def quick_sort(array)
  array.flatten!
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
     quick_sort(right) + [pivot] + quick_sort(left)
  end
end

array = [[1,3],[2,5,6],[-1,32,44]]
p sorted_array = quick_sort(array)
