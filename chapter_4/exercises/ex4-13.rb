# Exercise 4-13
### Problem ###
# You wish to store a set of n numbers in either a max-heap or a sorted array.
# For each application below state which data structure is better or if it does
# not matter. Explain your answers
### End ###
#
# a) Want to find the maximum element quickly.
#   For this situation both a max-heap and a sorted array would take O(1) time to find
#   the maximum. However, if successive calls to extract-max were required then a sorted
#   array would be a better choice as it would continually take O(1) time, whereas a heap
#   would take at worst O(nlogn)
#
# b) Want to be able to delete an element quickly
#   A max-heap would be a better choice for this task as at worst deleting any element
#   takes O(logn) to search and O(nlogn) to replace. A sorted array on the other hand would
#   take O(n) to search and at worst O(n) to replace. Depending on the position in the heap
#   the replace could take O(klogk) where k is the height remaining of the heap, so elements lower 
#   in the heap would be faster to delete than those near the root.
#
# c) Want to be able to form the structure quickly
#   If we only want to construct an out of order max-heap then a max-heap would be a better choice
#   for this task as that can be constructed in O(n). However, if a dominant respective max-heap 
#   or sorted array needs to be constructed then there is no significant difference.
#
# d) Want to find the minimum element quickly
#   For this task a sorted array is a much better choice. A sorted array guarantees O(1) time 
#   to find the min element, but a max-heap can only offer O(logn) as there is no guarantee of where 
#   the min is in a max-heap
