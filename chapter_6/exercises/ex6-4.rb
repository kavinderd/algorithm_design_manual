# Exercies 6-4
### Problem ###
# Can Prim's and Kruskal's algorithm yeild different minimum spanning trees? Explain why or why not.
### End ###
# 
# Yes, due to the nature of the two algorithms. Prim's is dependent on the start vertex and all the vertices that have been 
# seen but not included in the tree. Kruskal's is not dependent on a start vertex and simply processes all the edges in order 
# of weight. Thus there can be a case where two edges of the same weight may or may not appear in the MST depending on
# whether Prim's or Kruskal's is used.
