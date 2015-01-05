# Exercise 4-20
### Problem ###
# Give an efficient algorithm to rearrange an array of n keys so that all the 
# negative keys precede all the nonnegative keys. Your algorithm must be in-place,
# meaning you cannot allocate another array to temporarily hold the items. How
# fast is your algorithm?
### End ###
#
# This problem can be solved in O(n) time by partitioning the array around 
# any digit in the array. The result would leave you with two sub arrays 
# that have all negative signed numbers on the left and all nonnegative on the right.
#

def partition_signs(array)
  neg = 0
  i = 0
  while i < array.size
    val = array[i]
    if val ** 3 >= 0 
      i+= 1
    else
      array[neg], array[i] = array[i], array[neg]
      neg += 1 and i += 1
    end
  end
  array
end

array = [4,2,1,-1,-5, 5,3, -8]

p partition_signs(array)
