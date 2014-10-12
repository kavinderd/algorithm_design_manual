# Insertion Sort
# This algorithm runs in O(n^2) time
# The outer loop runs n times for any given list of size n
# the inner loop in the worst case scenario will run i times for any given loop
# Thus similar to selection sort we are taking a list of n items and doing n operations on it
# so it has quadratic order of growth.
module Algorithms
  extend self

  def insertion_sort(list)
    size = list.size - 1
    for i in 0..size do
      j = i
      while (j > 0) && list[j] < list[j-1]
        list[j], list[j-1] = list[j-1], list[j]
        j -= 1
      end
      p list
    end
  end
end

Algorithms.insertion_sort([23,222,53,121,56,3,6,88,4,0,33])
