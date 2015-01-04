# Exercise 4-15
### Problem ###
# a) Give an efficient algorithm to find the second-largest key among n keys.
#    You can do better than 2n-3 comparisons.
# 
# b) Then give an efficient algorithm to find the third-largest key among n keys.
#    How many key comparisons does your algorithm do in the worst case? Must your 
#    algorithm determine which key is largest and second largest in the process?
### End ###
# 
#
# To solve a, first n-1 comparisons need to be made to find the largest key. This can be extracted
# from the array leaving n-1 elements. Then bubble down can be called on the n-1 array which 
# takes log(n-1) time. Finally you can call extract min. In total finding the second-largest element
# would require n-1+logn-1 = n + logn - 2
