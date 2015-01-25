# Exercise 4-44
### Problem ###
# Design a stack that supports push, pop and retrieving the minimum element
# in constant time. Can you do this?
### End ###
# 
# I don't think this algorithm could be created, at least as a single data structure. Ensuring
# push and pop in constant time is doable as long as there is no secondary need for ensuring any 
# sorting on each push or pop. This is because any data structure that can maintain a the min or max,
# such as a priority queue has been shown to manage push and pop in O(logn) time as any new
# element needs to be compared to at least logN other elements.
