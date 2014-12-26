# Exercies 4-3
# ### Problem ###
# Take a sequence of 2n real numbers as input. Design an O(nlogn) algorithm that partitions the numbers in n pairs,
# with the property that the partition minimizes the maximum sum of a pair. For example, say we are given the 
# numbers (1,3,5,9). The possible paritions are ((1,3), (5,9)), ((1,5),(3,9)) and ((1,9)(3,5)). The pair sums for
# these paritions are (4,14), (6,12), and (10,8). Thus the third partition has 10 as its maximum sum, which is the minimum over the three partions.
# ### end ###
#
# To solve this problem its necessary to understand a property of a list of numbers, when sorted the lowest maximum sum of any pair would be
# the last number with the first. For example, to miminize the maximum sum of any possible pair in (4,5,12, 20, 100) 100 must be paired with 4.
# Since 100 paired with anything else will be larger than 104. So building upon this principle, if we sort an array and then 
# pass through it once pairing the left most value in the array with the right most until all possible pairs are made. This will result 
# in a O(nlogn + n) time which can be effectively reduced to O(nlogn).
#

def min_pairs(array)
  pairs = []
  array = array.sort # Assume ruby's sort function runs at worst in O(nlogn)
  i = 0
  j = array.size - 1
  while i < j
    pairs << [array[i], array[j]]
    i += 1
    j -= 1
  end
  pairs
end

array = [4, 100, 20,15, 12,5]
puts "minimized maximum pairs are #{min_pairs(array)}"
