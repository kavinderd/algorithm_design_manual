# Exercise 4-11
### Problem ###
# Design an O(n) algorithm that, given a list of n elements, finds all the elements,
# that appear more than n/2 times in the list. Then, design an O(n) algorithm that,
# given a list of n elements, finds all the elemnts that appear more than n/4 times.
### End ###
#
# To solve this problem in O(n) we need to keep two data elements as we pass through 
# the array once, a hashtable of the number of times each integer appears and an array 
# of the numbers that appear n/k times.

def find_frequency_above_k(array, k)
  count_hash = Hash.new { 0 }
  winners = []
  freq = array.count / k
  array.each do |num|
    unless winners.include? num
      count_hash[num] += 1
      if count_hash[num] >= freq
        winners << num
      end
    end
  end
  winners
end

array = [3,2,1,1,2,3,1,1,4,6,3,2,2,4,1,5,3,6,4,4]
puts "Frequency above half the count: #{find_frequency_above_k(array, 2)}"
puts "Frequency above a quarter of the count: #{find_frequency_above_k(array, 4)}"

