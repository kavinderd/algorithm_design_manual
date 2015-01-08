# Exercise 4-16
### Problem ###
# Use the partioning idea of a quicksort to give an algorithm that finds the median
# element of an array of n integers in expected O(n) time. (Hint: must you look at 
# both sides of the partition?)
### End ###
#
#  To solve this equation in O(n) time we can leverage the notion that the optimal
#  pivot point (the median) would have an equal number of items in both sub arrays.
#  So even when we pick a random pivot and we make the first partition we will know how far away
#  we are from the median. Thus for every subsequent partition we are only looking at n-(smaller_array_size) which is 
#  the length of the larger sub array.


def partition(array)
  pivot = array.shift
  l_arr = []
  r_arr = []
  array.each do |i|
    if i < pivot
      l_arr << i
    else
      r_arr << i
    end
  end
  [[l_arr], [pivot], [r_arr]]
end

def find_median(array)
  median = nil
  l_arr, pivot, r_arr = partition(array)
  required_length = (array.size / 2) 
  result = []
  loop do
    result += l_arr[0] + pivot
    if result.size > required_length
      while result.size > required_length
        median = result.pop
      end
      break
    elsif l_arr.first.size < r_arr.first.size
      l_arr, pivot, r_arr = partition(r_arr.first)
    end
  end
  median
end

array  = [4,2,1,3,6,5,9,7, 8]
puts "Median = #{find_median(array)}"
