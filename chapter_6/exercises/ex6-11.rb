# Exercise 6-11
### Problem ###
# Modify Prim's algorithm so that it runs in time O(m+nlogk) on 
# a graph that has only k different edges costs.
### End ###
#
# Instead of keeping the weights in an array. Create a heap and pop off the 
# min edge each time from the heap. As a heap is a more efficient DS for such operations
# this would satisfy the runtime O(m+nlogk)
