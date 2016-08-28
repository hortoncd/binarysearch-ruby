#!/usr/bin/env ruby

# A class to implement binary search rather than monkey patching class Array
class BinarySearch
  attr_accessor :array

  def initialize()
    @array = []
  end

  # Implements the binary search algorithm on an array of ints
  # (although being ruby, it probably works for more than ints)
  def binsearch(low, high, key)
    return -1 if ! @array or high < low

    mid = low + ((high - low)/2)

    return mid if @array[mid] == key

    if key < @array[mid]
      return binsearch(low, mid - 1, key)
    else
      return binsearch(mid + 1, high, key)
    end
  end

  # binsearch wrapper that takes key and assumes you want to search
  # the entire array
  def search(key)
    return -1 if ! @array
    return binsearch(0, @array.length - 1, key)
  end
end
