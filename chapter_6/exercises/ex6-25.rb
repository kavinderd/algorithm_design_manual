# Exercise 6-25
### Problem ###
# An edge cover of an undirected graph G=(V,E) is a set of edges such tath each
# vertex in the graph is incident to at least one edge from the set. Give an
# efficient algorithm, based on matching, to find the minimum-size edge cover for G.
### End ###
#
# Build on the solution from 6-24.
# With the set of disjoint edges giving a maximum matching add edges to the
# remaining vertices that were not included in the match.
