# Exercise 5-3
### Problem ###
#  Prove by induction that there is a unique path between any pair of vertices in a tree
### End ###
# 
# Given the base case of the tree
#   X
#   |
#   |
#   Y
#
# There is a single unique path from x -> y
#
# Making the inductive step by adding a child to Y, or another child to X
#
#   X ---- T
#   |      
#   |
#   Y
#   |
#   |
#   Z
#
#  There is a single path from Z to its parent Y and from T to its parent X. Each path is unique to the pair and no path
#  between any vertices is shared.

