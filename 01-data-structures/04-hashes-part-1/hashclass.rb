require_relative "hash_item"

class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    item = HashItem.new(key, value)
    i = index(key, @size)

    while @items[i] != nil && value != @items[i].value
      resize
    end
    @items[i] = item
  end



  def [](key)
    item = @items[index(key, @size)]
    item.nil? ? nil : item.value
  end

  def resize
    @size *= 2
    new_hash = Array.new(@size)
    @items.each do |item|
      if item != nil
        new_hash[index(item.key, @size)] = item
      end
    end
    @items = new_hash
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

end
