module Enumerable
  # Your code goes here
  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for items in self
      yield(items)
    end
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    arr = []
    for item in self
      if yield(item) == true
        arr <<  item
    end
    end
    arr
  end

  def my_all?
    arr = []
    for item in self
     arr << yield(item)
  end
  if arr.include?(false)
    return false
  else
    return true
  end
end

  def my_any?
    arr = []
    for item in self
     arr << yield(item)
    end
    if arr.include?(true)
      return true
    else
      return false
    end
  end

  def my_none?
       arr = []
    for item in self
       arr << yield(item)
    end
    if arr.all?(false)
      return true
    else
      return false
    end
  end

    def my_count
      count = 0
      
      if block_given?
        for item in self
          if yield(item) == true
            count += 1
          end
        end
      else
        count = self.length
      end
      return count
    end
    
    def my_map
      arr = []
      for item in self
        arr << yield(item)
      end
      arr
    end

    def my_inject(initial_value = 0)
      for items in self
        initial_value = yield(initial_value, items)
      end
      initial_value
    end



end

