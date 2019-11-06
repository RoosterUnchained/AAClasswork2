class MaxIntSet
  attr_reader :indices, :store
  def initialize(max)
    @store = Array.new(max) { false }
    @indices = (0..max).to_a
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    if indices.include?(num)
      return true
    else
      raise "Out of bounds" 
    end
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num if !include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

require "byebug"
class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      self[num] << num 
      @count += 1
    end
    resize! if num_buckets == count
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
  
  def resize!
    # debugger
    storer = Array.new(@count * 2) { [] }
    # debugger
    @store.each do |bucket|
      if !bucket.empty?
        bucket.each do |num|
          storer[num] << num
        end
      end
    end
    @store = storer
  end
end
