# Exercise 6-3
### Problem ###
# Assume that all edges in the graph have distinct edge weights ( i.e no pair of edges have the same weight)
# Is the path between a pair of vertices in a minimum spanning tree necessarily a shortes path between the
# two vertices in the full graph? Give a proof or a counterexample
### End ###
# 
# No, even when all the edges have distinct weight there is no guarantee that the MST will have all the
# shortest paths between any two vertices.
#
# E.G.
#
# A-B 1
# B-C 2
# C-D 3
# B-D x
#
# In the graph described above if the weight of edge B-D has a weight > 2 and < 5 then it would 
# be the shortest path between B & D but would not be included in the MST.
