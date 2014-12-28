# Exercise 4-9
### Problem ###
# Give an effikcient algorithm to compute the union of sets A and B where n = max(|A|, |B|).
# The output should be an array of distinct elements that form the union of the sets such that 
# they appear exactly once in the union.
#
# a) Assume that A and B are unsorted. give an O(nlogn) algorithm for the problem
### End ###
# 
# This problem can be solved in O(nlogn) time if we sort the two sets and then merge them together.
# In the case of duplicate numbers we can disregard the number from one and move on. In actual times, 
# this algorithm would run in O(nlogn + mlogm + n) where n is the count of the higher of A, B, and m
# being the count of the smaller. 
#
def distinct_array_from_two(array1, array2)
  array1 = array1.sort
  array2 = array2.sort
  merge(array1, array2)
end 

def merge(array1, array2)
  result = []
  i = 0
  j = 0
  while i < array1.size && j < array2.size
    if array1[i] < array2[j]
      result << array1[i]
      i += 1
    elsif array1[i] > array2[j]
      result << array2[j]
      j += 1
    else
      result << array1[i]
      i += 1
      j += 1
    end
  end
  while i < array1.size
    result << array1[i]
    i += 1 
  end
  while j < array2.size
    result << array2[j]
    j += 1
  end
  result
end

array1 = [5,2,7,3,78,9,1]
array2 = [3,2,6,4,13,81,12,1]
puts "union of 1 and 2 = #{distinct_array_from_two(array1, array2)}"

# b) Assume that A and B are sorted. Give and O(n) algorithm for the problem
#
# Same as above without the sorting phase. Merge the two and only add one
# when there are duplicates
