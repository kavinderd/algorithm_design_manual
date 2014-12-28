# Exercise 4-8
### Problem ###
# Given a set of S containing n real numbers and a real number x. We seek an algorithm to determine
# whether two elements of S exist whose sum is exactly x.
#
# a) Assume that S is unsorted. Give an O(nlogn) algorithm for the problem.
### End ##
#
# Part a can be solved by sorting the array and then iterating over the array comparing a low value i
# with a high value j. This algorithm runs in pure O(nlogn + n) which can effectively be reduced to 
# O(nlogn) 

def find_sum_in_array(array, x)
  array = array.sort
  i = 0
  j = array.size - 1
  sum_exists = false
  while i < j
    if array[i] + array[j] > x
      j -= 1
    elsif array[i] + array[j] < x
      i += 1
    else
      puts "sum with #{array[i]} #{array[j]}"
      sum_exists = true 
      break;
    end
  end
  sum_exists
end

array =[10, 2, 4, 5, 1, 7]
[14, 17, 21].each do |x|
  puts "sum of #{x} exists? #{find_sum_in_array(array, x)}"
end
