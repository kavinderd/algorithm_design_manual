# Exercise 4-30
### Problem ###
# A company database consists of 10,000 sorted names, 40% of whom are known as good customers and who
# together account for 60% of the access to the database. There are two data structure options to consider for
# representing the database:
#   - Put all the names in a single array and use binary search
#   - Put the good customers in one array and the rest of them in a second
#     array. Only if we do not find the query name on a binary serach of the first
#     array do we do a binary search of the second array.
#
# Demonstrate which option gives better expected performance. Does this change if linear search on an unsorted
# array is used instead of binary serach for both options?
### End ###
#
# Using binary search finding a name in a single db of all the names would run in O(log(10k)), and if we split the
# names between good and not-good customers a worst-case search would take O(log(4k) + log(6k)) which is actually greater
# than log(10). So with binary search keeping all the names in a single list is the appropriate choice.
#
# In the case of lineary search then the comparison in time is O(10k) vs  (6k + 4k) in the worst case. Because there is no real
# difference in worst-cases either could be chosen, but to optimize the average and best case it does make sense to 
# split the arrays as when we find the name amongst the list of good customers the tradeoff is between O(10k) vs O(4k)
