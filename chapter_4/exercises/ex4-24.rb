# Exercise 4-24
### Problem ###
# Let A[1..n] be an array such that the first n-sqrt(n) elements are already sorted though we know nothing about the remining elements. 
# Give an algorithm that sorts A in substantially better than nlogn steps.
### End ###
#
# If we already have an array sorted to the n-sqrt(n) position this will leave far fewer elements in A unsorted than are already sorted. 
# For example in an array of 9, the first 6 are sorted, 16 the first 12 and so on. As n becomes increasingly large, the amount sorted will
# as well. We can sort the remainder more efficiently than nlogn if we first sort the unsorted portion of the array in
# O(n-sqrt(n)log(n-sqrt(n)) and then merge the two sub-arrays in a total of n-sqrt(n) time. 
