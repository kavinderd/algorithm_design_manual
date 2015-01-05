# Exercise 4-18
### Problem ###
# Suppose an array A consists of n elements, each of which is red, white or blue. We seek to sort the 
# elements so that all the reds come before all the whites, which come before all the blues. The only
# operation permitted on the keys are:
# - Examine(A, i) - report the color of the ith element of A
# - Swap(A, i , j) - swap the ith element of A with the jth element.
# 
# Find a correct and efficient algorithm for red-white-blue sorting. There is a linear time solution.
### End ###
#
# This algorithm can be solved using the Dutch National Flag Algorithm where the array would needed to be divided
# into subsections (reds,mids, unknowns and blues). In one pass of the array we keep track of 3 positions, where the 
# last red is, where the last white is and where the last blue is. When traversing over the array we use 
# the mid(white) index as our position. When the value at mid is red we swap the value at the current red index with 
# the mid index and increase both indices. When the value is the mid(white) we simply increase the mid and move on
# When the value is equal to the high(red) we swap the value with the value at the red index and decrement the red index.
#
# Given 0 = red, 1 = white, 2 = blue t

def three_way_partition(array)
  lo = 0
  mid = 0
  hi = array.size - 1
  while mid <= hi
    val = array[mid]
    case val
    when 0
      array[lo], array[mid] = array[mid],array[lo]
      lo += 1
      mid += 1
    when 1
      mid += 1
    when 2
      array[mid], array[hi] = array[hi], array[mid] 
      hi -= 1
    end
  end
  array
end

array = [2,2,1,0,0,1,1,2,0,1]
p three_way_partition(array)
