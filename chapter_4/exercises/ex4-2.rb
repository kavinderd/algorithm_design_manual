# 4-2
### Problem ###
# For each of the following problems give an algorithm that finds the desired numbers within
# the given amount of time. To keep your answers brief, feel free to use algorithms from the
# book as subroutines. For the example S = { 6, 13, 19, 3, 8 }, 19 - 3 maximizes the difference,
# while 8 - 6 minimizes the difference.
#
# a) Let S be an unsorted array of n integers. Give an algorithm that finds the pair x, y, in S that
# maximizes | x - y |. Your algorithm must run in O(n) worst-case time.
#
# We'll need to examine every element in the array at least once, hence the O(n) time required, but
# luckily that's all that will be required. If we pass over the array and keep track of the 
# overall maximum and overall minimum we can solve this problem

def maximize_difference(array)
  lowest = 99999999
  highest = 0
  array.each do |number|
    lowest = [lowest, number].min
    highest = [highest, number].max
  end
  (highest - lowest).abs
end

array = [6, 13, 19, 3, 8]
puts "Max diff = #{maximize_difference(array)}"

# b) Let S be a sorted array of n integers. Give an algorithmsthat finds the pair x, y in S
# that maximizes |x - y|. Your algorithm must run in O(1) worst-case time.
#
# Since the algorithm is sorted finding the min and max, as done above, is quite simple; it will
# always be the first and last value. The positions of those two values is constant, so our
# algorithm can run in constant time.

def max_sorted_dif(array)
  (array[-1] - array[0]).abs
end

array = [3, 6, 8, 13, 19]
puts "Max diff of sorted = #{max_sorted_dif(array)}"

# c) Let S be an unsorted array of n integers. Give an algorithm that finds the pair x, y in S
# that minimizes |x - y| for x != y. Your algorithm must run in O(nlogn) worst-case time.
#
# This problem is more involved than the previous two as we need to find the two closest numbers in order
# to minimize the diff. If we sort the algorithm in O(nlogn) time we can then pass over the array comparing every
# i with i + 1 and keeping track of the diff. This algorithm would run in O(nlogn + n) which can be effectively
# reduced to O(nlogn).  We could also eliminate the second O(n) pass of the array by incorporating
# the search of the smallest diff as we sort the array. In mergesort for example, at every merge we can compare
# the added value with the previous.
#

module Calc

  extend self

  def min_diff(array)
    @min_diff = 99999
    mergesort(array)
    @min_diff
  end

  def mergesort(array)
    if array.size <= 1
      return array
    else
      mid = array.size / 2
      l = mergesort(array[0...mid])
      r = mergesort(array[mid..-1])
      merge(l, r)
    end
  end

  def merge(left, right)
    i = 0
    j = 0
    result = []
    while i < left.size && j < right.size
      if left[i] < right[j]
        result << left[i]
        i += 1
      else
        result << right[j]
        j += 1
      end
      smaller_diff?(result)
    end
    while i < left.size
      result << left[i]
      i += 1
      smaller_diff?(result)
    end

    while j < right.size
      result << right[j]
      j += 1
      smaller_diff?(result)
    end
    result
  end

  def smaller_diff?(result)
    @min_diff = [(result[-1] - result[-2]).abs, @min_diff].min if result[-2]
  end

end

array = [6, 13, 19, 3, 8]
puts "min diff = #{Calc.min_diff(array)}"

# d) Let S be a sorted array of n integers. Give an algorithm that finds the pair x, y in S that
# minimizes |x-y| for x!=y. Your algorithms must run in O(n) worst-case time.
#
# The approach here is similar to the one above, except that since we have a sorted array to begin with
# we just need to step through it once and compare every i with i-1 and keep track of the smallest diff 
# between an i and an i-1

def sorted_min_diff(array)
  min = 9999
  array.each_with_index do |num, i|
    next if i == 1
    min = [ (num - array[i-1]).abs, min].min
  end
  min
end

array = [3,6,8,13,19]
puts "min diff = #{sorted_min_diff(array)}"

