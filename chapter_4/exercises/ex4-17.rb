# Exercise 4-17
### Problem ###
# The median of a set of n values is the [n/2]th smallest value.
#
# a) Suppose quicksort always pivoted on the median of the current sub-array. How many comparisons
# would Quicksort make then in the worst case?
### End ###
# 
# If we select the median element in each sub-array we would then achieve the optimal running time of O(nlogn) because 
# each partition would result in equal halves this given:
# [4,3,6,1,2,5,7] and the pivot = 4, 6 comparisons are made
# [3,1,2] [4] [6,5,7] and the pivots are 2 and 6, 2 + 2 = 4 comparisons are made
# [1] [2] [3] [4] [5] [6] [7] 
#
# So in total 10 comparisons are made for a 7 element array this is significantly less than 7log7 but for larger
# array sizes the running time would come close to O(nlogn)
#
# b) Suppose quicksort were always to pivot on the [n/3]th smallest value of the current sub-array. How many comparisons would be made
# then in the worst case? 
#
# 
