# Exercise 4-31
### Problem ###
# Suppose that you are given an array A of n sorted numbers that
# has been cicularly shifted k positions to the right. For example {35, 42, 5, 15, 27, 29 } 
# is a sorted array that has been cicularly shifted k = 2 positions, while {27, 29, 35, 42, 5, 15 } has
# been shifted k = 4 positions.
#   - Suppose you know what k is. Give an O(1) algorithm to find the largest number in A.
#   - Suppose you do not know what k is. Give an O(lg n) algorithm to find the largest number
#   in A. For partial credit you may give an On) algorithm.
### End ###
# 
# If we know what k is then in the first example { 35, 42, 5, 15, 27, 29} k is 2, that must mean that the 
# max value is one less than k so k-1. This simple algorithm, would run in constant O(1) time since we just
# need to index an array at one smaller value.
#
# If we do not know what k is then we must find two values where i - 1 > i. This only occurs once
# in a shifted array between the greatest and lowest value. An O(n) solution would require iterating
# over all n elements in the array, but we can find the element faster by using binary search which runs in O(logn) time.
# In binary search we would take a sub array and compare the lowest index with the highest and see if the lowest is 
# larger than the highest. If it is then we would run binary search again on the sub array. If it isn't we simply
# toss out the sub array. As we break down sub arrays we need to keep track of the difference between the low high comparisons
# we make as well as the value of the low, this ensures that when we find the greatest difference which will be the global max minus the
# global min we can set the value which we eventually return. 

def custom_binary_search(array, low, high)
  unless high-low < 1
    if array[low] > array[high]
      mid = (high + low) / 2
      if array[mid] < array[high]
        # Transition is in bottom half
        if array[mid] > array[mid-1]
          return array[mid]
        else
          custom_binary_search(array, low, mid)
        end
      else
        # Transition is in top half
        if array[mid] > array[mid + 1]
          return array[mid]
        else
          custom_binary_search(array, mid, high)
        end
      end
    end
  end
end

def find_largest_in_shifted_array(array)
  custom_binary_search(array, 0, array.size - 1)
end

array = [35, 42, 5, 15, 27, 29]
puts "Max val = #{find_largest_in_shifted_array(array)}"


