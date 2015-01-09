# Exercise 4-21
### Problem ###
# Stable sorting algorithms leave equal-key items in the same relative order as in the original permutation. Explain what
# must be done to ensure that mergesort is a stable sorting algorithm.
### End ###
#
# To make mergesort a stable sorting algorithms in the case that we have a duplicate the value from the left most array 
# should be placed into the resulting merged array first. This makes it stable because the left array or lower indexed array
# holds the first instance of the duplicate number.
