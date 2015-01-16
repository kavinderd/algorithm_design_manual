# Exercise 4-29
### Problem ###
# Mr. B.C. Dull claims to have developed a new data structure for priority queues that supports the operations
# Insert, Maximum, and Extract-Max -all in O(1) worst case time. Prove that he is mistaken. (Hint: the agreement
# does not involve a lot of gory details-just think about what this would imply about the Omega(nlogn) lower bound
# for sorting.)
### End ###
# 
# The O(1) cannot be possible since the optimal lower bound on sorting is O(nlogn), and the optimal search time is lower bounded
# by O(logn). Thus a PQ relies on inserting new elements into their right position which at worst requires O(n) comparisons and
# at best O(1). It is not possible to maintain the integrity of a Priority Queue regardless of its implementation
# without ensuring that new elements are properly placed and that extracting the max element will be the global max. To comply with
# either requirement comparisons of some amount must be made and in the worst case will require times significantly greater than
# O(1)
