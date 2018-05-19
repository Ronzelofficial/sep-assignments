class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    if !empty?
      @queue.delete_at(@queue.length-1)
    end
    @tail = @queue.last
    @head = @queue.first
  end

  def empty?
    @queue.length == 0
  end
end
