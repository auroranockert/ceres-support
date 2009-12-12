module Ceres
  class PrioritySet
    def initialize(&block)
      @array, @size = [], 0
      
      if block_given?
        @comparer = block
      else
        @comparer = lambda { |x, y| x <=> y }
      end
    end
    
    def size
      @array.size
    end
    
    def empty?
      @array.empty?
    end
    
    def peek
      @array.first
    end
    
    def pop
      @array.shift
    end
    
    def push(*values)
      @array = (@array + values)
      @array.uniq!
      @array.sort! &@comparer
      self
    end
  end
end