#done

def bucket_sort(arr, bucket_size = 1)
  if arr.empty? || arr.length == 1
    return arr
  end


  min = arr.min
  max = arr.max



  bucket_count = ((max - min) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end



  (0..arr.length - 1).each do |i|


    buckets[((arr[i])-min / bucket_size).floor].push(arr[i])
  end




  arr = []
  (0..buckets.length - 1).each do |i|
    buckets[i] = insertion_sort(buckets[i])
    buckets[i].each do |value|
    if value != nil
      arr.push(value)
      end
    end
  end

  arr
end





def insertion_sort(collection)
  sorted_array = [collection.delete_at(0)]

  until collection.length == 0
    insert_value = collection.shift
    i = 0
    until i == sorted_array.length || insert_value < sorted_array[i]
      i += 1
    end
    sorted_array.insert(i, insert_value)
  end



  sorted_array



end

arr = [1,2,3,4,23,42,111,11,2345,66,5,6,7,8,9].shuffle
p arr

bucket_sort(arr)
