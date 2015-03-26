# Exercise 6-17
### Problem ###
# Either prove the following or give a counterexample:
# a) Is the path between a pair of of vertices in a minimum spanning tree of an undirected graph necessarily
#    the shortest (minimum-wieght) path?
# b) Suppose that the minimum spanning tree of the graph is unique. Is the path between a pair of vertices 
#    in a minimum spanning tree of an unidrected graph necessarily the shortest path?
### End ###
#
# a) No, E.G.
#    
#    G 
#    A-B 3
#    B-C 4
#    A-C 4
#
#    MST 
#    A-B 3
#    A-C 4
#
#    Shortest path concerning B-C
#    B-C 4
#    A-C 4
# 
# b) no, E.G.
#    G
#    A-B 4
#    B-C 3
#    A-C 2
#
#    MST
#    B-C 3
#    A-C 2
#
#    Shortest path concerning A-B
#    A-B 4
#    A-C 2
