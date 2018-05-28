require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method inserts the node at the end of the list.
  def add_to_tail(node)
    if self.head == nil
      self.head = node
    else
      self.tail.next = node
    end
    self.tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  #question about this right here.
  def remove_tail
    if self.head != nil && self.head.next != nil
      x = self.head
      while x.next != nil
        y = x
        x = x.next
      end
        y.next = nil
      self.tail = y
    else
      self.tail = nil
    end
  end


  # This method prints out a representation of the list.
  def print
    node = @head
    until node == nil do
      puts node.data
      node = node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      remove_front
    elsif @tail == node
      remove_tail
    else
      current_node = @head
      until current_node.next == node
        current_node = current_node.next
      end
      current_node.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    node.next = self.head
    self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    x = self.head
    self.head = x.next
    x.next = nil
  end


end
