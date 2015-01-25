# Exercise 4-41
### Problem ###
# Describe advantages and disadvantages of the most popular sorting algorithms.
### End ###
# 
# Of all the nlogn sorting algorithms there are a few tradeoffs in terms of space usage
# and worst case running time. 
# Mergesort runs in O(nlogn) but is difficult to implement to operate in place. Thus, mergesort
# usually requires O(n) space as well.
# Quicksort can be just as fast as the other algorithms, but it runs the risk of operating in O(n2) 
# time if the list is in reverse order or a poor parition is chosen every time. It is easier to implement 
# as an in-place algorithm, so it has the advantage of requiring O(1) additional space.
# Heap sort, similar to quicksort is an in-place O(nlogn) algorithm. It has the downside of not being a 
# stable sort, meaning the original order of the elements is not guaranteed to be preserved.:w
# 
