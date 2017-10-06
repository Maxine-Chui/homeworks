class Stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end

end

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
    el
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue
  end

end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    existing = @map.index { |pair| pair[0] == key }
    if existing
      @map[existing][1] = value
    else
      @map << [key, value]
    end
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def show
    @map
  end

end
