# Exercise 6-8
### Problem ###
# Devise and analyze an algorithm that takes a weighted graph G find the smallest change in the
# cost to a non-MST edge that would cause a change in the minimum spanning tree of G. Your algorithm
# must be correct and run in polynomial time.
### End ###
#
# - Run Prim's Algorithm
#   - at each vertex iterate over each edge
#     - track the minimum difference between the MST edge for that vertex and all other edges 
#       for the current vertex
#   - the overall min difference is the smallest change required to change the graph.
#
# Will implement later
