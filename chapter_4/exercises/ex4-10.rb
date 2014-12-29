# Exercise 4-10
### Problem ###
# Given a set of S of n integers and an integer T, give an O(n^k-1logn) algorithm
# to test whether k of the integers in S add up to T
### End ###
#
#  This algorithm can be solved in the required time by following the listed steps:
#  1. Sort the set ( O(nlogn) )
#  2. For every sum of a pair a1 + a2 + a3 + a(k-1) < T ( O(n^k-1) ) find if the remainder T - (sum) also exists ( O (logn) )

def k_sum_to_x?(array, x, k=3)
  array = array.sort
  # assume k = 3
  i = 0
  exists = false
  i.upto(array.size - 1) do |i|
    (i+1).upto(array.size - 1) do |j|
      sum = array[i] + array[j]
      remainder = x - sum
      if sum < x && remainder != array[i] && remainder != array[j]
        exists = array.include?(x - sum)
        break if exists
      end
    end
    break if exists
  end
  exists
end

array = [3,4,12,2, 5, 19, 20, 15]
puts "Sum in 3 exists for 20? #{k_sum_to_x?(array, 20)}"
puts "Sum in 3 exists for 35? #{k_sum_to_x?(array, 35)}"
puts "Sum in 3 exists for 8? #{k_sum_to_x?(array, 8)}"
