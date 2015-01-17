# Exercise 4-33
### Problem ###
# Suppose that you are given a sorted sequence of distinct integers { a1, a2, ..., an}.
# Give an O(lg n) algorithm to determine whether there exists an i index such as 
# ai = i for example in { -10, -3, 3 , 5, 7 } a3 = 3 in {2, 3, 4, 5, 6, 7} there is no such 
# ai.
### End ###
# 
# In the positive example given in the problem a3 references the index position 2, so from the outset
# it is obvious that we will need to take that into account for any ai matches we make. 
#
# To find such an ai it is useful to note that in an array if an index in i is greater than the value of the index + 1
# ( a[i] > i + 1 ) then every value greater than i cannot satisfy the ai = i requirement since the array is sorted.
# Thus if we conduct a binary search on the sequence checking if a[i] < i + 1 we can leverage the O(logn) aspect
# of that algorithm.

def search(array, low, high)
  if high-low < 1
    return array[high] if array[high] == high + 1
  else
    mid = (low + high) / 2
    if array[mid] == mid + 1
      return array[mid]
    elsif array[mid] <= mid + 1
      search(array,low, mid)
    elsif array[mid] >= mid + 1
      return "None"
    end
  end
end

def find_matching_index_and_value(array)
  search(array, 0, array.size - 1)
end

array= [-10, -3, 3, 5, 7]
puts "Ai = #{find_matching_index_and_value(array)}"

array= [2, 3, 4, 5, 6, 7]
puts "Ai = #{find_matching_index_and_value(array)}"

