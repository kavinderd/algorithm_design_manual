# Exercises 5-4
### Problem ###
# Prove that in a breadth-first search on a undirected graph G, every edge is either a tree edge or a cross edge, where x is neither an ancestor nor
# descendant of y, in cross edge (x,y)
### End ###
#
# In a graph a tree edge links an ancestor to a descendent and a cross edge links a vertex to a non-ancestor and non-descendant such as a brother, cousin or uncle vertex.
# In a BFS we process all the descendants of a vertex before processing all the descendants of those vertices. So, given the graph
#       
#         A------B----D
#         |    / | 
#         |  /   |
#         |/     |
#         C----- E
# a BFS would result in a traversal of the following order A,B,C,D,E, and the edges we would encounter would be
#   A--B Tree
#   A--C Tree
#   B--D Tree
#   B--E Tree
#   B--C Cross
#   C--E Tree
# 
# Because a BFS exhausts all 1st degree neighbors of vertex x we cant encounter an edge going back to an ancestor, as this edge ( in an undirected scenario ) would already
# be examined. For this reason, we cannot encounter a back edge. A BFS will leave us then with tree edges from ancestors to descendants but also cross edges. The cross edges
# exist as in the case of B---C in the example above. There can be a case that a vertex x with two descendants y, z where a BFS would pass over x---y and x---z, but would not 
# find z---y when examining edges from x. When the BFS moves to searching either y or z it would find z---y a cross edge that links two sibling vertices.
#
#
