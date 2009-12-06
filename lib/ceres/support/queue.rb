module Dispatch
  class Queue
    def at(time, &block)
      if (t = time - Time.now) > 0.0
        self.after(t) { block.call }
      else
        self.dispatch { block.call }
      end
    end
  end
end