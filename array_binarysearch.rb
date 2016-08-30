# Version of binary search implemented by extending the Array class
# for shits and giggles

module ArrayExtensions
  # Implements the binary search algorithm on an array of ints
  # (although being ruby, it probably works for more than ints).
  # Assumption is that the array is already sorted.
  def binsearch(low, high, key)
    return -1 if high < low

    mid = low + ((high - low)/2)

    return mid if self[mid] == key

    if key < self[mid]
      return binsearch(low, mid - 1, key)
    else
      return binsearch(mid + 1, high, key)
    end
  end

  # binsearch wrapper that takes key and assumes you want to search
  # the entire array
  def binary_search(key)
    return binsearch(0, self.length - 1, key)
  end
end

class Array
  prepend ArrayExtensions
end
