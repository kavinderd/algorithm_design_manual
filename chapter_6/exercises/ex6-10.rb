# Exercise 6-10
### Problem ###
# Let G = (V,E) be an undirected graph. A set F of E edges is called a feedback-edge set 
# if every cycle of G has at least one edge in F.
#
# a)  Suppose that G is unweighted. Design an efficient algorithm to fnd a minimum-size
#     feedback-edge set.
# b)  Suppose that G is a weighted undirected graph with positive edge weights. Design
#     an algorithm to find a minimum-weight feedback-edge set.
### End ###
#
# a) Run a DFS add every back edge to the set. This ensures that at least one edge from every cycle
#    is included in the set.
#    (Will implement later)
# 
# b) create a maximum spanning tree and keep track of the edges not added these will be the minimum feedback-edge set
#    as any lesser weighted edge that was part of a cycle in G would not have been selected in the MST, thus
#    leaving it for the Minimum Weight Feedback Edge. ( will implement later)
