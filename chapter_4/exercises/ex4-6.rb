# Exercise 4-6
### Problem ###
# Given two sets S1 and S2 ( each of size n) and a number x describe an O(nlogn) algorithm for finding whether there
# exists a pair of elements, one from S1 and one from S2 that add up to x.
### End ###
#
# Given ( 0, 3, 6, 7, 8, 9) and (1, 4, 3, 2, 11, 12) and x = 17 the sum of 6 & 11 is a value answer. To find this in a way more
# efficient than O(n2) it's important to be aware of the fact that when sorted we can narrow down our potential answers by comparing
# the sum of S1[i] + S2[j] with x. If the sum is too high we can disregard all possible sums before and vice versa if it is too high.
# Sorting the two algorithms takes O(nlogn + nlogn) and a final pass of n results in O(nlogn + nlogn + n)
#

# array1 and array2 must be of the same size
def find_sum_in_arrays(array1, array2, sum)
  array1 = array1.sort
  array2 = array2.sort
  i = 0
  j = array1.size - 1
  sum_present = false
  while i < array1.size && j >= 0
    if array1[i] + array2[j] < sum
      # Curren sum is too small, increase i
      i += 1
    elsif array1[i] + array2[j] > sum
      # Curren sum is too big, decrease j
      j -= 1
    else
      # found our sum
      sum_present = true
      break;
    end
  end
  sum_present
end

array = [0,9,8,6,7,3]
array2 = [1,4,3,2,11,12]
puts "Is the sum 23 in arrays? #{find_sum_in_arrays(array, array2, 23)}"
