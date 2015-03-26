# Exercise 6-9
### Problem ###
# Consider the problem of finding a minimum weight connected subset T of edges from a 
# weighted connected graph G. The weight T is the sum of all the edge weights in T.
# a) Why is this problme not just the minimum spanning tree problem? Hint: think negative weight edges.
# b) Give an efficient algorithm to compute the minimum weight connected subset T.
### End ###
#
# a) This is not simple a MST problem b/c a minimum weight could be found by taking all the
# negative edges regardless of whether the connected vertices are already in T.
# E.G.
# G
# A-B -2
# B-C -2
# A-C -1
# B-D -3
# D-C -2
# D-A 3
#
# MST
# A-B -2
# B-C -2
# B-D -3
# MST weight = -7
#
# Min Weigth Subset
# A-B -2
# B-C -2
# A-C -1
# B-D -3
# D-C -2
# Min Weigth = -10
#
# b) Run Kruskal's Algorithm
#     If an edge is negative add it to the tree
#     Run Kruskal's as normal above edge weights > 0 if the connected components count > 1
#
# Will implement later
