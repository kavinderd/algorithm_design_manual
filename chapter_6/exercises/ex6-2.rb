# Exercise 6-2
### Problem ###
# Is the path between two vertices in a minimum spanning tree necessarily a shortest
# path betweeen the two vertices in the full graph? Give a proof or a counterexample
### End ###
#
# No, in a MST the weight of each individual edge takes precedence over a 
# shortest path between any two vertices. 
# E.G.
#
# A-B 2
# A D 5
# B C 2
# C D 2
#
# MST: 
#
# A-B 2
# B-C 2
# C-D 2
#
# In this MST the path from A-D has a weight of 6 ( A-B-C-D), however the shortest path in the original
# graph is 5 (A-D).

