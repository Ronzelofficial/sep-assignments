require_relative 'node'

class MinBinaryHeap
  attr_reader :root

  def initialize(root)
    @root = root
  end

  def insert(node)
    queue = [@root]
    array = [0]
    while !queue.empty?
      temp = queue.shift
      array.push(temp)
      queue.push(temp.left) if temp.left
      queue.push(temp.right) if temp.right
    end
    array.push(node)
    organize(array, array.size - 1)
    array.each_with_index do |node, index|
      next if index === 0
      @root = node if index === 1
      node.left = array[2 * index]
      node.right = array[2 * index + 1]
    end
  end

  def organize(array, index)
    parent_index = index / 2
    return if index <= 1
    return if array[parent_index].rating < array[index].rating
    swap(array, index, parent_index)
    organize(array, parent_index)
  end

  def swap(array, source_index, target_index)
    array[source_index], array[target_index] = array[target_index], array[source_index]
  end

  def find(data)
    return nil if data === nil
    result = nil
    queue = [@root]
    while !queue.empty?
      temp = queue.shift
      if temp.title === data
        result = temp
        break
      end
      queue.push(temp.left) if temp.left
      queue.push(temp.right) if temp.right
    end
    return result
  end

  def delete(data)
    return nil if data === nil
    queue = [@root]
    array = [0]
    while !queue.empty?
      temp = queue.shift
      array.push(temp)
      queue.push(temp.left) if temp.left
      queue.push(temp.right) if temp.right
    end

    array.each_with_index do |node, index|
      next if index === 0
      if node.title === data
        array[index] = nil
        break
      end
    end

      array.each_with_index do |node, index|
        next if index === 0
        @root = node if index === 1
        if node
          node.left = array[2 * index]
          node.right = array[2 * index + 1]
        end
    end
  end

  def printf
      queue = [@root]
      while !queue.empty?
        temp = queue.shift
        puts "#{temp.title}: #{temp.rating}\n"
        queue.push(temp.left) if temp.left
        queue.push(temp.right) if temp.right
      end
    end
  end
