# Exercise 4-25
### Problem ###
# Assume that the array A[1..n] only has numbers from {1,...,n^2} but that at most loglogn of these numbers
# ever appear. Devise an algorithm that sorts A in substantially less than O(nlogn).
### End ###
#
# Some math is needed to break down this problem. In the case that n = 4, the set of possible numbers is { 1, 4, 9, 16}.
# To sort the array efficiently we can first pass over the array in n time and create a hash of the count for each number, 
# and create an array of distinct numbers. We can then sort this smaller array which is of size loglogn in O(lologn(log(loglogn)) time.
# Finally we just need to create the resulting array by taking each number from the sorted array and 
# adding it as many times as it appeared in the original array. 
