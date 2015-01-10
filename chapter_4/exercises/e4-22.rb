# Exercise 4-22
### Problem ###
# Show that n positivie integers in the range 1 to k cna be sorted in O(nlogk)
# time. The interesting case is when k << n
### End ###
#
# In the case that n <= k this algorithm would be solved in O(nlogn) time. For example,
# [2,3,4,5,6] where n = 5 and k = 10, the value of k plays no role in efficiently
# sorting the algorithm, because sorting within O(nlogn) is faster and the obvious result
# of implementing an optimal sorting algorithm to the collection.
#
# In the case the k < n, we can deduce that there is one or more elemnts that repeats. For example,
# when n = 6 and k = 5 a possible list would be [2,1,4,3,5,5]. Normally, this array would be 
# sorted in O(nlogn) as each element would need to be compared n times. However, it is possible to use
# heapsort where every element in the heap would contain a value and also the number of times
# it appears in the list. Thus we would only make O(nlogk) comparisons as duplicate entries would not
# create additional nodes in the heap, but would simply increment the count of that pre-existing value
# in the heap.
