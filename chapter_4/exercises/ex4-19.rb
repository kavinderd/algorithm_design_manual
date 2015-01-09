# Exercise 4-19
### Problem ### 
# An inversion of a permutation is a pair of elements that are out of order.
#
# a) Show that a permutation of n items has at most n(n-1)/2 inversions. Which 
# permutation(s) have exactly n(n-1)/2 inversions?
#
# b) Let P be a permutation and P^r be the reversal of this permutation. Show that P
# and P^r have a total of exactly n(n-1)/2 inversions.
#
# c) Use the previous result to argue that the expected number of inversions in a 
# random permutation is n(n-1)/4
#
### End ###
#
# a) Given the array a permutation of [4,2,6] there must be 3 possible inversions:
#     [6,4], [2,4], [6,2]
#     For [4,2,1,6,7] there should be 10
#     [7,4], [6,7], [1,4], [2,4], [7,2],[6,2],[1,2], [6,1], [7,1], [7,6]
        
#     So fromt these two examples we can induce that for any set of n
#     the 1st number has n-1 inversions
#     then n-2
#     n-3...n-n
#     
#     The total number of inversions is the sum from 0 to n - 1 which can be expressed as n(n-1)/2
#
#     Permutations that have no repetions have exactly this many inversions
#
# b)  For a given permutation we would have a maximum of n(n-1)/2 inversions but also an equal number of in order pairs
#     for example at 1 we have n-1 pairs
#     at 2 n-2
#     and so on so because at every n we have the same number of in order and out of order pairs then when reversed the number
#     of inversions will still at most be n(n-1)/2
#
# c)  We can argue that for any random permutation that half the numbers will be in order and the other
#     half out of order. So from any x to n there will be a probability that half the numbers from x to n will 
#     produce inversions.  Thus, this will result in (n(n-1)/2)/2
