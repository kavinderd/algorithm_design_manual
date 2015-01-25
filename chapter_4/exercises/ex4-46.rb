# Exercise 4-46
### Problem ###
# You are given 12 coins. One of them is heavier or lighter than the rest. Identify
# this coin  in just three weighings.
### End ###
#
# Weigh the first four agains the next four. 
#   If they weigh the same, then the anomaly is in the last four (9,10,11,12)
#     Then weigh the first two again 9,10
#       If they are the same then weigh against 11
#         If they are the same then it is 12
#         else it is 11
#       else it is in 9,10
#         weigh against 9
#   else they do not weight the same, then the answer is in the first 8
#     weigth 1,5,6 against 2,7,8
#       if they are the same then the answr is either 3/4
#         weigh 3 against 4
#       else if 1 5 6 is heavier
#         weigh 5 against 6
#           if there is a difference then it's the heavier one
#           else it is one
#        same for 2 7 8
#
#        http://mathforum.org/library/drmath/view/55618.html
