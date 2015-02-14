# Exercise 5-14
### Problem ###
# A vertex cover of a graph G=V,E is a subset of vertices....Delete all the leaves from any
# depth first search tree of G. Must the remaining vertices for a vertex cover of G? Give a proof
# or a counterexample.
### End ###
#
# Yes, given a tree that looks like
#                 A
#          B           C
#      D      E      F   G
#
# A depth first search where we would delete all leaves would leave us with
# A , B ,C as the remainder of our tree.  These three vertices make a vertex cover 
# of our original tree. This reliably works because edges to leaves are inherently edges
# to a vertex of degree 1. However, it should be noted that although we are left with a vertex cover of G,
# we aren't guaranteed to be left with a minimal-size cover as the remaining internal nodes could share the
# same edge.
