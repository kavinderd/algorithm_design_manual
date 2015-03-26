# Exercise 6-5
### Problem ###
# Does either Prim's and Kruskal's algorithm work if there are negative edge weights? Explain why or why not
### End ###
#
# Yes, both algorithms work with negative edges. Kruskal's will sort those negative edges to the top of the queue
# and thus those edges will be processed and selected first. In the case of prim's algorithm the negative ege
# will be chosen from any in_tree vertex to any non_tree vertex as it represents the shortest distance.
