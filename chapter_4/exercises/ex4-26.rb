# Exercise 4-26
### Problem ###
# Consider the porblem of sorting a sequence of n O's and 1's using comparisons.
# For each comparison of two values x and y, the algorithm learns which of x < y
# x = y and x > y holds.
# a) Give an algorithm to sort in n-1 comparisons in the worst case. Show that your 
# algorithm is optimal.
# b) Give an algorithm to sort in 2n/3 comparisons in the average case (assuming each of the n
# inputs is 0 or 1 with equal probability) Show that you algorithm is optimal.
### End ###
#
# a. Take the array A and iterate over it comparing i to i -1. Swap if i < i -1, do nothing if
# i == i-1. This would take n-1 comparisons as is the standard case to sort an array made of binary components
# as every element is compared against all other elements once (n-1)

def binary_sort(array)
  i = 0
  j = 1
  while j < array.size
    if array[j] < array[i]
      # 1 0
      array[j], array[i] = array[i], array[j]
      i += 1
      j += 1
    elsif array[j] == array[i]
      j += 1
    elsif array[j] > array[i]
      i += 1
      j += 1
    end
  end
  array
end

array = [0,1,0,1,0,1,0,0,0,1,1,1,0,1,0,1]
p "Sorted Binary array = #{binary_sort(array)}"

# b. If we know that 0 and 1 occur in equal probability then we can sort the array faster by looking at pairs.
# Pairs will either be equal, greater or less. In the case that a pair is equal we pair it with another pair 
# and in the case that the pairs are unequal we sort the pairs so that they end up 0,1. For example, in 
# 00 11 01 01 we would first make n/2 comparisons and end up with two sub arrays:
# [(00) (11)] and [(01)(01)]. On additional comparison is made in the left sub array to determine if they are in order
# and the right sub array can be sorted without any comparisons b/c we know the first of both pairs is 0. This results in
# [(00) (11)] and [(00)(11)] finally without any additionall comparisons we can merge the two arrays by swapping the first of the right
# sub array with the second of the left sub array. This results in [0 0 0 0 1 1 1 1]
#
# By treating the items as part of a pair and knowning that there is an equal number of 0s and 1s we only need to make n/2 comparisons
# the first time, then in the average case n/4 pairs will have equals so we make another n/8 comparisons.

def equal_binary_sort(array)
  equals = []
  unequals = []
  ones = []
  zeros = []
  while array.any?
    left, right = array.shift, array.shift
    if left > right
      ones << left
      zeros << right
    elsif left == right
      equals << [left, right]
    else
      ones << right
      zeros << left
    end
  end
  equals.each do |item|
    if item[0] == 0
      zeros += item
    else
      ones += item
    end
  end
  zeros + ones
end

array = [0,1,0,1,0,1,0,0,0,1,1,1,0,1,0,1]
p "Sorted Binary array = #{equal_binary_sort(array)}"
