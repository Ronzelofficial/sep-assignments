require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @items = Array.new(size)
  end

  def []=(key, value)
    if (1+number_of_items.to_f)/ size > @max_load_factor
      resize
    end
    newitem = index(key, size)
    new_node = Node.new(key, value)
    if !@items[newitem]
      datalist = LinkedList.new
      datalist.add_to_tail(new_node)
      @items[newitem] = datalist
    else
      datalist = @items[index(key, size)]
      current_node = datalist.head
      if current_node.next
        current_node = current_node.next
      end
      if !current_node.next
        datalist.add_to_tail(new_node)
      end
    end
  end


  def [](key)
    datalist = @items[index(key, size)]
    current_node = datalist.head
    while current_node.next && current_node.key != key
      current_node = current_node.next
    end
    current_node.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    number_of_items.to_f / size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  def number_of_items
    counter = 0
    @items.each do |datalist|
      if datalist
        current_node = datalist.head
        counter += 1
        while current_node.next
          current_node = current_node.next
          counter += 1
        end
      end
    end
    return counter
  end

  # Resize the hash
  def resize
    #determine how many times to double before looping
    new_array_size = 2 * size
    temp = @items
    @items = Array.new(new_array_size)
    temp.each do |datalist|
      if datalist
        current_node = datalist.head
        self[current_node.key]= current_node.value
        while current_node.next
          current_node = current_node.next
          self[current_node.key]= current_node.value
        end
      end
    end
  end
end
