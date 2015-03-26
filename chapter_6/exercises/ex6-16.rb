# Exercise 6-16
### Problem ###
# Answer all of the following:
# 
# a) Give an example of a weighted connected graph G = (V, E) and a vertex v,
#    such that the minimum spanning tree of G is the same as the shortest path
#    spanning tree rooted at v.
# b) Give an example of a weighted connected directed graph G = (V,E) and a 
#    vertex v, such that the minimum-cost spanning tree of G is very different
#    from the shortest-path spanning tree rooted at v.
# c) Can the two trees be completely disjointed?
### End ### 
#
# a) G
#    U-V 2
#    U-W 1
#    V-W 4
#    
#    MST & Shortest Path
#    U-V 2
#    U-W 1
# 
# b) G
#    A-V 4
#    B-V 4
#    C-V 4
#    A-B 3
#    B-C 3
#
#    MST
#    A-V 4
#    A-B 3
#    B-C 3
#
#    Shortest Path rooted at v
#    A-V 4
#    B-V 4
#    C-V 4
#
# c) No, the MST and shortest path will always share at least one path between
#    v and x where x is a neighbor vertex whose shortest path is one edge which is
#    of minimum wieght to x from v. This edge will be included in both the MST and Shortest Path Tree.
