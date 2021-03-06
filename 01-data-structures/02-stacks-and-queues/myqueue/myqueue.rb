class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    @head = @queue.first
    @tail = @queue.last
  end

  def dequeue
    if !empty?
      @queue.delete_at(0)
    end
    @head = @queue.first
    @tail = @queue.last
  end

  def empty?
    @queue.length == 0
  end
end
