# Exercise 4-34
### Problem ###
# Suppose that you are given a sorted sequence of distinct integers { a1, a2...an}
# drawn from 1 to m where n < m. Give an O(lg n) algorithm to find an integer <= m
# that is not present in a. For full credit find the smallest such integer.
### End ###
#
# To solve this probelm and find the smallest missing value between 1 and m in O(n) 
# time would simply require iterating over the array. To solve this problem faster 
# we can use binary search to find the smallest value where a[i] != i + 1. This is similar
# to the previous exercise. If all i + 1s == a[i] then we would have an array of consecutive integers,
# so any disruption in that provides us the value we are looking for. 

def search(array, low, high, min)
  if high - low < 1
    if array[low] != low + 1
      min = [min, low + 1].min
    end
  else
    mid = (low + high) / 2
    min = [min, mid+1].min if array[mid] != mid + 1
    if array[mid] > mid + 1
      min = search(array, low, mid, min)
    elsif array[mid] == mid + 1
      min = search(array, mid + 1, high, min)
    end
  end
  min
end

def find_smallest_missing(array)
  search(array, 0, array.size - 1, array[-1] + 1)
end

#array = [1,3,4,5]
#puts "And the smallest missing value is: #{find_smallest_missing(array)}"

array = [1,2,3,4,5,6,7,9,10,11,12,14]
puts "And the smallest missing value is: #{find_smallest_missing(array)}"
