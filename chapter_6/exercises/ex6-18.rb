# Exercise 6-18
### Problem ###
# In certain graph problems, vertices have can have weights instead of or in addition to the weights of edges. Let Cv be the cost of vertex v, and C(x,y) the cost of the edge (x,y). This problem is concerned with finding the cheapest path between vertices a and b in a graph G. The cost of a path is the sum of the costs of the edges and vertices encountered on the path.

#    a) Suppose that each edge in the graph has a weight of zero (while non-edges have a cost of ∞). Assume that Cv=1 for all vertices 1≤v≤n (i.e., all vertices have the same cost). Give an efficient algorithm to find the cheapest path from a to b and its time complexity.
#    b) Now suppose that the vertex costs are not constant (but are all positive) and the edge costs remain as above. Give an efficient algorithm to find the cheapest path from a to b and its time complexity.
#    c) Now suppose that both the edge and vertex costs are not constant (but are all positive). Give an efficient algorithm to find the cheapest path from a to b and its time complexity.
#
### End ###
#
# a) Breadth First Search O(n+m)
# b) Dijkstra's algorithm but instead of tracking edge weight keep track of vertex weight
# c) Dijkstra's add edge weight and vertex weight for every distance.
#
# Will implement later.

