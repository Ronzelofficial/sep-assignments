#donehope

def poorly_written_ruby(*arrays)
  combined_array = []
    arrays.flatten!.each do |value|
      combined_array << value
    end

    sorted_array = [combined_array.pop]

    for val in combined_array
      i = 0
      while i < sorted_array.length
        if val <= sorted_array[i]
          sorted_array.insert(i, val)
          break
        elsif i == sorted_array.length - 1
          sorted_array << val
          break
        end
        i+=1
      end
    end
    sorted_array
end


poorly_written_ruby([[1,4,3],[2,5,6],[-1,44,5,32,44]])
