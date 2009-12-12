module Ceres
  class PrioritySet
    def initialize(&block)
      @array, @size, @mutex = [], 0, Mutex.new
      
      if block_given?
        @comparer = block
      else
        @comparer = lambda { |x, y| x <=> y }
      end
    end
    
    def size
      @mutex.synchronize do
        @array.size
      end
    end
    
    def empty?
      @mutex.synchronize do
        @array.empty?
      end
    end
    
    def peek
      @mutex.synchronize do
        @array.first
      end
    end
    
    def pop
      @mutex.synchronize do
        @array.shift
      end
    end
    
    def push(*values)
      @mutex.synchronize do
        @array = (@array + values)
        @array.uniq!
        @array.sort! &@comparer
      end
      
      self
    end
  end
end