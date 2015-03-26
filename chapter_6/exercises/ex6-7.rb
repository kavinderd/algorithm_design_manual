# Exercise 6-7
### Problem ###
# a) Let T be a minimum spanning tree of a weighted graph G. Construct a new graph G'
#    by adding a weight of k to every edge of G. Do the edges of T for a MST of G'
# b) Let P = { s,...,t} describe the shortest weighted path between vertices s and t of a 
#    weighted graph G. Construct a new graph G' by adding a weight of k to every edge
#    of G. Does P describe the shortest path from s to t in G'?
### End ##
#
# a) Yes, T will stil represent the MST for G'.
#    E.G.
#    
#    G
#    A-B 3
#    B-C 1
#    A-C 4
#    
#    T
#    A-B 3
#    B-C 1
#
#    if k = 2
#    G'
#    A-B 5
#    B-C 3
#    A-C 6
#
#    T
#    A-B 5
#    B-C 3
#
# b) No, by adding k to G, P cannot be guaranteed to represent the shortest path.
#    E.G.
#    P = { A,...,D }
#
#    G.
#    A-B 2
#    B-C 1
#    C-D 1
#    A-D 5
#
#    P = { A, B, C , D }
#    w(P) = 4
#
#    if k = 1
#    G' 
#    A-B 3
#    B-C 2
#    C-D 2
#    A-D 6
#    
#    P = { A, D}
#    w(P) = 6
#    
#    In this case, after adding 1, the weight of the original shortest path between A and D increased to 7, thus losing
#    out to a new shortest path. If a shortest path is constructed of many edges over a less edges/ greater weight path then 
#    when adding a k value that less edges/greater weight will stand a chance of becoming the shortest path since less weight
#    will be added to it by successive additions of k.
#
#    
