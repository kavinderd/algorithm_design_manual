# Exercise 5-24 
### Problem ###
# Adding a single directed edge to a directed graph can reduce the number of weakly connected
# components, but by at most how many components? What about the number of strongly connected 
# components?
### End ###
# 
# The above statement is true given the following example. If we have a Directed Graph, of the
# following nature,
#
# 1 --> 2  <-- 3
# 4 --> 5  --> 6
#
# This graph has 2 weakly connected components. If a directed edge were to be added in either direction between any vertex in the set [1,2,3] and [4,5,6]
# this would result in a graph with 1 weakly connected component. The number of weakly connected components that a single edge can reduce is 1, since a weakly
# connected component ignores edge direction adding an edge can only fuse 2 weakly connected components to 1 and no more. Adding a single directed edge also
# can have the effect of reducing the number of strongly connected components by 1 as an edge could be added between two weakly connected vertices that
# would then be bidirectional, fusing two strongly connected components into one.
