# Exercise 4-5
### Problem ##
# The mode of a set of numbers is the number that occurs most frequently in the set. The set (4,6,2,4,3,1) has a mode of 4. Give an
# efficient and correct algorithm to compute the mode of a set of n numbers
### end ##
#
# This problem can be solved in O(n) time by using a hashtable. As we step through the array we need to maintain to data values: 1. A Hash
# corresponding to a number and its frequency, 2. A value holding the most frequent number thus far. By also checking the max value
# as we step through the array we avoid having to check the hashtable a second time.

def find_mode(array)
  modes = Hash.new { 0 }
  highest_mode = 0
  array.each do |num|
    modes[num] += 1
    highest_mode = num if highest_mode < modes[num]
  end
  highest_mode
end

array = [1,3,5,2,6,1,3,65,3,1,1,3,4,1]
puts "The mode for the array is #{find_mode(array)}"
